The webpage is based on [Jekyll al-folio](https://github.com/alshedivat/al-folio) theme. See there for all the details. Also you can check their [readme](/README.md) or [some notes on how to customize stuff](/CUSTOMIZE.md). Below, I have listed some quick setup.

# Work and edit on my local computer
It is important to apply your edits on your local machine and make sure they look okay before pushing on github, because the moment you push, it will automatically deploy on the web. It is the responsibility of the git committer to make sure that their edits are appropriate and accurate. After push, make sure to check there is no deploy errors on github. For this, check the `pages-build-deployment` workflow page on github ([link](https://github.com/labicon/labicon.github.io/actions/workflows/pages/pages-build-deployment)) and make sure the workflow runs with no error (it takes a few minutes after your push for the workflow to start, you can see all the workflows [here](https://github.com/labicon/labicon.github.io/actions). There are usually some errors for other workflows such as broken links or Prettier code formatter which is fine. The one that says `pages-build-deployment` with a `bot` tag near it is important).

## How to pull the repo
There are many ways. Perhaps the easiest (assuming you have [github CLI](https://cli.github.com/)) is

```bash
gh repo clone labicon/labicon.github.io
```

## How to locally preview the website
There are some ways described in [the al-folio installation document](/INSTALL.md). The recommended way is to first install [Docker desktop](https://www.docker.com/products/docker-desktop/). Then, for the first time, inside the repo folder, do

```bash
docker compose pull
```

To preview, do

```bash
docker compose up
```

# How to change the text on the front (about) page
You need to modify [\_pages/about.md](/_pages/about.md).

# How to modify papers
Change [/\_bibliography/papers.bib](/_bibliography/papers.bib). There are some useful extra things you can add (see [these instructions](https://github.com/alshedivat/al-folio/blob/master/CUSTOMIZE.md#adding-a-new-publication) for more details). For instance:
* If you add `bibtex_show={true}`, the bibtex source of the paper will be shown for someone to copy. 
* Add paper link by `html={<link>}`
* Add `arxiv={xxxx.xxxxx}` for arXiv link (note that you should only insert the 9 digit arXiv identifier, not the whole link).
* Add `preview={<image-file-name>}` to have a picture shown to the left of the paper. `<image-file-name>` is the file name that exists in [/assets/img/publication_preview/](/assets/img/publication_preview/). This can be a `gif` file to make it exciting! ([example](https://alshedivat.github.io/al-folio/publications/)).
* Add `paper={<pdf-file-name.pdf>}` to show a pdf version of the paper (good for preprints perhaps).`<pdf-file-name.pdf>` should be in [/assets/pdf/](/assets/pdf/).

## Change the number of authors shown for papers
By default, only the first 3 authors are shown, the rest are hidden. To change this, you need to change `max_author_limit: 3` in [/_config.yml](/_config.yml) (leave blank to show all authors).

# Modifying projects
Each project has a file in the [/_projects/](/_projects/). See the existing projects there to get an idea.

## Add paper references for a project
It might be useful to cite papers when talking about a project and have a list of cited papers at the bottom of the page. For doing so for a project (same concept holds for posts, which we do not currently have), to cite a paper, do

```liquid
{% cite <bib-entry-id> %}
```

Also, make sure to have `related_publications: true` on top of the project page.

# News
Each news has a file in [/_news/](/_news/). See the examples there to get an idea. It is useful to name the file for a new such that it starts with the date so that everything is organized.

# Modifying the people page
See [/notes/people.md](/notes/people.md).

# Modifying the icon that shows up on the first page
See [/notes/icon.md](/notes/icon.md).

# Modifying the carousel (image slider) on the first page
See [/notes/carousel.md](/notes/carousel.md).

# Changing fonts 
See [/notes/fonts.md](/notes/fonts.md).