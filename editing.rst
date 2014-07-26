How to Edit
===========

Arc-docs is a set of documentation that is built and hosted on `ReadTheDocs <http://readthedocs.org>`_.  ReadTheDocs is a service builds the documentation from a ``git`` repository whenever it receives a `webhook`_ event which is fired every time a new commit is made to that repo.  The Arc-Docs repo is hosted on github: https://github.com/PSU-OIT-ARC/arc-docs

.. _webhook: https://developer.github.com/webhooks/`

The easiest way to edit Arc-Docs is by navigating to the page you want to make a change to, then click the `Edit on Github` button in the top right corner of the page.  This will take you to that files page on the github repo which will allow you to edit it in the browser.

Most changes can be made directly to the shared repo in the PSU-OIT-ARC organization, but you are free to use the fork, modify pull request pattern if you wish for larger changes or changes you want feedback on.

ReadTheDocs and Sphinx
======================

ReadTheDocs fully supports the `Sphinx`_ documentation tool, which has quickly become the standard tool for documenting python projects.  Sphinx is a superset of `reStructuredText`_ which is largely a superset of Markdown.  It tends to be a bit more strict syntactically, but allows for much greater control over complex references and included codeblocks.

.. _reStructuredText: http://docutils.sourceforge.net/rst.html

.. _Sphinx: http://sphinx-doc.org

Useful RST References
----------------------

- `reStructuredText Primer <http://sphinx-doc.org/rest.html>`_

RST Tools
=========

It benefits from a well configured technical text editor such as ``vim``, ``emacs``, or `Sublime Text <http://www.sublimetext.com/3>`_.

SublimeText RST Tools
---------------------

- `reStructuredText Improved <https://sublime.wbond.net/packages/RestructuredText%20Improved>`_
- `Restructured Text (RST) Snippets <https://sublime.wbond.net/packages/Restructured%20Text%20(RST)%20Snippets>`_
- `Table Editor <https://sublime.wbond.net/packages/Table%20Editor>`_

Online Tools
------------

- `Online Sphinx Editor <https://livesphinx.herokuapp.com>`_
