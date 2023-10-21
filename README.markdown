bari -- a *mere* static site generator.

Requirements:

* You can read code (make & Python)
* You know what Pandoc is and know how to use it
* Your system has make, Python and Pandoc installed
* You can take these opinionated set of choices and modify it to your taste

Add a new blog post:

	cat > `date +%Y-%m-%d-01.md` << EOF
	first line is treated as title
	the rest of the post.
	fin.
	EOF

A file with 'YYYY-mm-dd' prefix is treated as a blog post. Anything after the 'YYYY-mm-dd' part is ignored by the program.

To build the blog posts, (home page) index.html & (archive page) archive.html, run `make`.

If you would like to add your name to each post, edit the Makefile and add `--metadata author="Your Name"` to the build step.

You can add a page (which is not a post), by creating a `anyfile.md` (ending with `.md` extension).

A page with title, date and author would look like this (following Pandoc's metadata header format):

	% Grand theories of the universe
	% 2020-04-28
	% A U Thor

	Herein I propose ...

Note: You should be able to use the YAML style headers like this:

	---
	title: Grand theories of the universe
	date: 2023-10-21
	author: A U Thor
	---

	Herein I propose ...

----

The generated HTML files are written to the same directory. That is, `about.md` becomes `about.html`.


----

Explanation of the files:

* `Makefile` -- main "script" to drive the compilation
* `style.css` -- style for the HTML files (uses [water.css](https://kognise.github.io/water.css/))
* `bari` -- script to generate HTML pages from markdown
* `inc.before` -- If you want to add more links (eg: about), this is where you add it.
* `inc.after` -- If you want to add a copyright to the footer, this is where you add it.

----

What's the reasoning behind the name - bari?

bari (ಬರಿ) means *write* and *mere* in Kannada. So, you can *bari* your posts using *bari* markdown and generate your blog with *bari* pandoc, make and python.


----

References: 

1. [Configuring a publishing source for your GitHub Pages site - GitHub Docs](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)