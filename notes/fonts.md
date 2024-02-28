# Change font to LaTeX font

* First, added latex fonts from [this github repo](https://github.com/vincentdoerig/latex-css/tree/master). I copied all the fonts from the `fonts` folder there to [assets/webfonts](/assets/webfonts/). 
* Then, I changed the [/_sass/font-awesome/regular.scss](/_sass/font-awesome/regular.scss) file by adding a few `@font-face` lines borrowed from the [style.css](https://github.com/vincentdoerig/latex-css/blob/master/style.css) file in the aformentioned github repo. These are the lines I added:

```
@font-face {
  font-family: 'Latin Modern';
  font-style: normal;
  font-weight: normal;
  font-display: swap;
  src: url('#{$fa-font-path}/LM-regular.woff2') format('woff2'),
    url('#{$fa-font-path}/LM-regular.woff') format('woff'),
    url('#{$fa-font-path}/LM-regular.ttf') format('truetype');
}

@font-face {
  font-family: 'Latin Modern';
  font-style: italic;
  font-weight: normal;
  font-display: swap;
  src: url('#{$fa-font-path}/LM-italic.woff2') format('woff2'),
    url('#{$fa-font-path}/LM-italic.woff') format('woff'),
    url('#{$fa-font-path}/LM-italic.ttf') format('truetype');
}

@font-face {
  font-family: 'Latin Modern';
  font-style: normal;
  font-weight: bold;
  font-display: swap;
  src: url('#{$fa-font-path}/LM-bold.woff2') format('woff2'),
    url('#{$fa-font-path}/LM-bold.woff') format('woff'),
    url('#{$fa-font-path}/LM-bold.ttf') format('truetype');
}

@font-face {
  font-family: 'Latin Modern';
  font-style: italic;
  font-weight: bold;
  font-display: swap;
  src: url('#{$fa-font-path}/LM-bold-italic.woff2') format('woff2'),
    url('#{$fa-font-path}/LM-bold-italic.woff') format('woff'),
    url('#{$fa-font-path}/LM-bold-italic.ttf') format('truetype');
}
```

* So far, we have added the fonts, and defined them. Now, we must define the styles. For this, we need to change the [/_sass/_base.scss](/_sass/_base.scss) file. 
* Basically, we need to add `font-family:  'Latin Modern';` to a lot of styles, such as `p`, `h1`, `h2`, ...
* To figure out which part to change, use Chrome inspect to knwo the style of a specific part. 
