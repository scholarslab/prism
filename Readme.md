# Prism

[![DOI](https://zenodo.org/badge/5103/scholarslab/prism.png)](http://dx.doi.org/10.5281/zenodo.10869)

Prism is a tool for collective interpretation, an experiment in crowd-sourcing and visualizing many readings of  a set of common texts.  As part of our project to make crowd-sourcing more meaningful and less mechanical, users interact subjectively with a text, highlighting it in accordance with certain interpretive categories, such as sound, sense, and modernism, to produce an aggregate visualization of all other users' markings that shows points of analytical agreement or disagreement.   

The basic workflow is simple:

1. Play in the sandbox on our introductory text to practice using the highlighting functionality.
2. After creating an account, choose a text to highlight.
3. The highlighting page automatically starts with the first category selected.  Simply click and drag over the desired text to change its color. To switch categories, simple click on the desired category.  Click on the eraser tool and then click and drag over text to undo any unwanted highlights.
4. When done, click the submit button to see a visualization.
5. To switch to the visualization for a different category, simply click on a different category.

Prism is an ideal tool for research and pedagogy alike; students can highlight a text and discuss their markings in class, and scholars can see how the world at large views these texts.

# Getting Started

Prism is a Ruby and Rails project, with several tools to get you
up-and-running quickly. Assuming you have Ruby and git installed
properly, the following commands will pull the latest version of the
software, set up the database, and import some default documents.

```
$ git clone git://github.com/scholarslab/prism.git
$ cd prism
$ bundle install
$ rake db:migrate
$ rake import:docs
```

## Contributing to the Project

[![Build Status](https://secure.travis-ci.org/scholarslab/prism.png)](http://travis-ci.org/scholarslab/prism?branch=master,production)
[![Code Climate](https://codeclimate.com/github/scholarslab/prism.png)](https://codeclimate.com/github/scholarslab/prism)

For a list of people who have contributed to the codebase, see the 
[list of contributors][contributors].

[contributors]: https://github.com/scholarslab/prism/graphs/contributors

### Patches/Pull Requests
 
* [Fork the project][fork].
* Make your feature addition or bug fix.
* Add tests for it, and make sure all the tests pass. This is important so we don't unknowingly break your changes in a future release. If you're fixing a bug, it helps us to verify that your bug does in fact exist. 
* Commit your changes to your own fork.
* Send us a [pull request][pull], with a clear explanation of the
changes. Bonus points for topic branches.

### Deploy to Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Deploy your own Prism installation to Heroku by clicking the "Deploy to Heroku button." Follow the Heroku instructions for importing your source code and cloning the new repository to your desktop. From within your new app's repository, you will need to run the following command to set up the database:

```
$ heroku run rake db:migrate
```

Note: the Facebook and Google login functions will only work on your personal installation if you integrate into heroku your own set of login credentials.

```
$ heroku config:add FACEBOOK_KEY=‘your Facebook key’
$ heroku config:add FACEBOOK_SECRET=“your Facebook secret”
$ heroku config:add GOOGLE_KEY=‘your google key’
$ heroku config:add GOOGLE_SECRET=“your google secret”
```

### Feedback
We rely on the [Github issues tracker][issues] for feedback on issues
and improvements.

## Copyright / License
This software is released under the [Apache 2.0][license]. 

[fork]: http://help.github.com/fork-a-repo/
[pull]: http://help.github.com/send-pull-requests/
[license]: LICENSE "LICENSE"

## Production Workflow

Make sure you're up to date:
$ git pull
edit
test things locally:
$ rails s
Commit things if working:
$ git add files
$ git commit –m 'message'
If works, test on staging, where staging is the name of the git remote pointing to the heroku: staging site – prism-staging12
$ git push staging master
if functionality is there, push to the github repository –
$ git push origin master

To deploy to capistrano
[after editing and committing to master branch]
git checkout feature/capistrano
git merge master
cap production deploy
