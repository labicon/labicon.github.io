This documents explains the details of the [/_pages/profiles.md](/_pages/profiles.md)

# How to add / modify profiles in people page

## How to add a new person

* Go to [/_pages/profiles.md](/_pages/profiles.md)
* There are several categories in the header: faculty, postdocs, grad students
* Add yourself in the correct category. It should be easy to see how to do so based on the existing profiles. Some things to keep in mind:
    * Create a new file with name `<your_name>.md` in the folder [/_pages/people_bios/](/_pages/people_bios/) and include your bio there.
    * Your photo file should go to [/assets/img/profile_pics/](/assets/img/profile_pics/).  <font color='red'>__IMPORTANT__ Please crop your photo with the exact ratio 215(w) x 296(h) so that all the photos have the same shape.</font>
    * Do not forget to add `profile_pics/` as a prefix to the `image` section, and also `people_bios` as a prefix to the `content` section. Look at Negar's profile as an example. 

## How to change my information?

Just look at the above information on how to add a new person, and it will be clear how to change stuff.

## How to add a new category of people (e.g. undergrads)?


In [/_pages/profiles.md](/_pages/profiles.md), find the `categories` list, and add a new category. `list_name` should exactly match the list that follows containing people in that category, and `show_name` is the title that is shown for that category. Then, you should add a list containing people. See the list `grad` as an example. 

# 3How to change the size of profile pictures?

In the file [/_layouts/profiles.liquid](/_layouts/profiles.liquid), line 22 which is

```liquid
{% capture sizes %}(min-width: {{site.max_width}}) {{ site.max_width | minus: 30 | times: 0.3}}px, (min-width: 576px) 20vw, 95vw"{% endcapture %}
```

change the `20vw` part to change the width of images. `vw` means `viewport width` and determines the percentage of the total width that is devoted to the image. So the number is between 0 and 100.

# Details

Details to stuff to remember for future. 

The main thing is [/_layouts/profiles.liquid](/_layouts/profiles.liquid). I modified it from the default for our purpose. Here is the content of the file:

```liquid
---
layout: page
---
<div class="post">
  <article>
    {% if page.categories %}
      {% for category in page.categories %}
        {% assign category_name = category.list_name %}
        {% assign category_show = category.show_name %}
        <h3>{{ category_show }}</h3>
        {% if page.[category_name] %}
          {% for profile in page.[category_name] %}
            <hr>
            <div class="profile float-{% if profile.align == 'left' %}left{% else %}right{% endif %}">
            {% if profile.image %}
              {% assign profile_image_path = profile.image | prepend: 'assets/img/' %}
              {% if profile.image_circular %}
                {% assign profile_image_class = 'img-fluid z-depth-1 rounded-circle' %}
              {% else %}
                {% assign profile_image_class = 'img-fluid z-depth-1 rounded' %}
              {% endif %}
              {% capture sizes %}(min-width: {{site.max_width}}) {{ site.max_width | minus: 30 | times: 0.3}}px, (min-width: 576px) 20vw, 95vw"{% endcapture %}
              {% include figure.liquid loading="eager" path=profile_image_path class=profile_image_class sizes=sizes alt=profile.image %}
            {% endif %}
            {% if profile.more_info %}
              <div class="more-info">{{ profile.more_info }}</div>
            {% endif %}
            </div>
  
            <div class="clearfix">
              {%if profile.name %}
                {%if profile.web %}
                  <h4><a href={{ profile.web }}>{{ profile.name }}</a></h4>
                {% else %}
                  <h4>{{ profile.name }}</h4>
                {% endif %}
              {%endif%}
              {% if profile.content %}
                {% capture profile_content %}{% include_relative {{ profile.content }} %}{% endcapture %}
                {{ profile_content | markdownify }}
              {% else %}
                {{ content }}
              {% endif %}
            </div>
            
          {% endfor %}
        {% endif %}
        <br>
      {% endfor %}
    {% endif %}
  </article>
</div>
```

It iterates through the categories, searches for a list with `category_name` (this is done by defining a variable via `{% assign category_name = category.list_name %}` and then `{% for profile in page.[category_name] %}`).

The `clearfix` div is where the person's description shows up (if `web` is given, link to person's webpage is added).

Person's name has `<h4>` style, so if you are not happy with people name sizes, you need to change that in `<h4><a href={{ profile.web }}>{{ profile.name }}</a></h4>` and `<h4>{{ profile.name }}</h4>`.