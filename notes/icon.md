This document describes how the icon is added on the first page title. 

# Long story short

### To change the logo

* Logo file is stored in [/assets/img/](/assets/img/) (for example the current logo is [/assets/img/ICON_logo.png](/assets/img/ICON_logo.png)). You can change / modify this file. 
* The file name is included in the header of [/_pages/about.md](/_pages/about.md) line 10 as `logo: ICON_logo.png`. You can change this if you want to use another logo. 

### What to do if the `Lab` besides the logo is not correctly aligned

* Open [/_sass/_base.scss](/_sass/_base.scss).
* To change teh `Lab` alignment, you need to change the `top` attribute of `.logo-header h1`. This should be in line 1158. 
* Play with it until you get the desired result (hint: decreasing the value (making it more negative) brings `Lab` upwards).

### I want to change the `Lab` that shows right to the icon, say I want to change it to `Laboratory`

* Change line 15 of [/_layouts/about.liquid](/_layouts/about.liquid) which is `<h1>Lab</h1>`:
```liquid
<div class="logo-header">
    <img  src="{{ page.profile.logo | prepend: '/assets/img/' | relative_url }}" width="160">
    <h1>Lab</h1> <-- CHANGE THIS
</div>
```


# Details

* I changed the `if` clause of line 7 in [/_layouts/about.liquid](/_layouts/about.liquid), which used to read

```liquid
{% if site.title == 'blank' %}
    {% comment %}
    Commented the standard first name / last name
    <span class="font-weight-bold">{{ site.first_name }}</span> {{ site.middle_name }}
        {{ site.last_name }}
    {% endcomment  %}
    <div class="logo-header">
        <img  src="{{ page.profile.logo | prepend: '/assets/img/' | relative_url }}" width="160">
        <h1>Lab</h1>
    </div>
{% else %}
    {{ site.title }}
{% endif %}
```

to

```liquid
{% if site.title == 'blank' %}
    {%comment%}
    Commented the standard first name / last name
    <span class="font-weight-bold">{{ site.first_name }}</span> {{ site.middle_name }}
    {{ site.last_name }}
    {%endcomment  %}
    <div class="logo-header">
        <img  src="{{ page.profile.logo | prepend: '/assets/img/' | relative_url }}" width="160">
        <h1>Lab</h1>
    </div>
{% else %}
    {{ site.title }}
{% endif %}
```

* We also need to add `logo-header` to css. For this, I added the following at the end of [_sass/_base.scss](/_sass/_base.scss):

```css
// logo-h1 side by side

.logo-header img {
  float: left;
  //width: 100px;
  //height: 100px;
  //background: #555;
}

.logo-header h1 {
  position: relative;
  top: -8px;
  left: 20px;
  font-size: 3.4rem;
}
```