# Readme
PRISM

# Badges
[![Build Status](https://secure.travis-ci.org/scholarslab/prism.png)](http://travis-ci.org/scholarslab/prism?branch=master,production)
[![Code Climate](https://codeclimate.com/github/scholarslab/prism.png)](https://codeclimate.com/github/scholarslab/prism)

# Getting Started

Prism is a tool for collective interpretation, an experiment in crowd-sourcing and visualizing many readings of  a set of common texts.  As part of our project to make crowd-sourcing more meaningful and less mechanical, users interact subjectively with a text, highlighting it in accordance with certain interpretive categories, such as sound, sense, and modernism, to produce an aggregate visualization of all other users' markings that shows points of analytical agreement or disagreement.  

The basic workflow is simple:

1. Play in the sandbox on our introductory text to practice using the highlighting functionality.
2. After creating an account, choose a text to highlight.
3. The highlighting page automatically starts with the first category selected.  Simply click and drag over the desired text to change its color. To switch categories, simple click on the desired category.  Click on the eraser tool and then click and drag over text to undo any unwanted highlights.
4. When done, click the submit button to see a visualization.
5. To switch to the visualization for a different category, simply click on a different category.

Prism is an ideal tool for research and pedagogy alike; students can highlight a text and discuss their markings in class, and scholars can see how the world at large views these three texts.

Although right now Prism lacks the functionality necessary to enable users to upload texts, developers can add new texts very easily.  All texts belong in the ```app/spec/fixtures/html``` folder, and they should include the following div classes contained within a ```<div id='bib'>```:

* **author**: Author's name (first and last)
* **pub_date**: Publication date for the version of the text included in the database
* **format**: Text or image
* **description**: Bibliographic information (publisher, context, etc.)
* **sandbox**: false (unless you are replacing the sandbox text)

Each category and color are joined within ```<div id='facets'>``` tag and are given class category and color accordingly.

If these documents are changed in any way, developers should type the following to clear and then rebuild the database:  

```
rake import:clear import:docs
```

## Contributing to the Project
### Feedback
We rely on the [Github issues tracker][issues] for feedback on issues
and improvements.

### Patches/Pull Requests
 
* [Fork the project][fork].
* Make your feature addition or bug fix.
* Add tests for it, and make sure all the tests pass. This is important so we don't unknowingly break your changes in a future release. If you're fixing a bug, it helps us to verify that your bug does in fact exist. 
* Commit your changes to your own fork.
* Send us a [pull request][pull], with a clear explanation of the changes. Bonus points for topic branches.

## Copyright
This software is released under the [Apache 2.0][license]. 

[fork]: http://help.github.com/fork-a-repo/
[pull]: http://help.github.com/send-pull-requests/
[license]: LICENSE "LICENSE"
