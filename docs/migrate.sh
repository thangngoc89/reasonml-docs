#!/bin/bash


# for filename in *.md; do
#   diff "$filename" ~/github/reasonml.github.io/docs/$filename
# done

read -d '' HeaderString << EOF
[ vim: set filetype=Markdown: ]: # (<style type="text/css">body {visibility: hidden} </style>)
[//]: # (<meta charset="utf-8">)
[//]: # (<script charset="utf-8" src="site/Paradoc.js"> </script>)
[//]: # (---)
[//]: # (\$NEW_TITLE_LINE)\$SUBTITLE\$HIDE_NAV_LINE\$HIDE_SEARCH_LINE
[//]: # (\$NEXT_PAGE_LINE)
[//]: # (rootPage: index)
[//]: # (siteTemplate: siteTemplate.html)
[//]: # (---)
EOF
NEXT_PAGE="what-and-why"
migrate() {
  filename=$1
  hide=$2
  subtitle=$3
  filecontents==$(cat $filename.md)
  # echo $filecontents | sed 's/\([oa]\)/X\1/g'  
  titleline=$(grep "title:" ${filename}.md)
  echo $titleline
  HEADER_FOR_FILE="${HeaderString/\$NEW_TITLE_LINE/$titleline}"

  nextPageLine="nextPage: ${NEXT_PAGE}"
  HEADER_FOR_FILE="${HEADER_FOR_FILE/\$NEXT_PAGE_LINE/$nextPageLine}"

  if [ "$hide" == "1" ]; then
    hideInSearchLine="
[//]: # (hideInSearch: true)"
    hideInNavLine="
[//]: # (hideInNav: true)"
  else
    hideInSearchLine=""
    hideInNavLine=""
  fi
  HEADER_FOR_FILE="${HEADER_FOR_FILE/\$HIDE_NAV_LINE/$hideInNavLine}"
  HEADER_FOR_FILE="${HEADER_FOR_FILE/\$HIDE_SEARCH_LINE/$hideInSearchLine}"


  if [ "$subtitle" == "" ]; then
    subtitleLine=""
  else
    subtitleLine="
[//]: # (subtitle: $subtitle)"
  fi
  HEADER_FOR_FILE="${HEADER_FOR_FILE/\$SUBTITLE/$subtitleLine}"

  echo "$HEADER_FOR_FILE" > ${filename}.html
  perl -p0e 's/---\ntitle:.*\n---\n//se' ${filename}.md | perl -p0e 's/.md/.html/sg' >> ${filename}.html
  NEXT_PAGE="$filename"
}


migrate articles-and-videos 0
migrate basic-structures 0
migrate boolean 1
migrate community 0
migrate converting-from-js 1
migrate destructuring 0
migrate draft-blog-posts 1
migrate editor-plugins 0
migrate events 0
migrate exception 0
migrate external 0
migrate extra-goodies 1
migrate faq 0
migrate function 0
migrate if-else 1
migrate imperative-loops 1
migrate installation 0
migrate integer-and-float 1
migrate interop 1
migrate jsx 0
migrate let-binding 0
migrate libraries 1
migrate list-and-array 1
migrate loops 0
migrate module 0
migrate more-on-type 1
migrate mutable-bindings 0
migrate mutation 1
migrate null-undefined-option 1
migrate object 0
migrate option 0
migrate overview 0
migrate pattern-matching 0
migrate pipe-first 1
migrate primitives 0
migrate promise 1
migrate quickstart-javascript 1
migrate record 0
migrate recursion 0
migrate regular-expression 1
migrate string-and-char 1
migrate syntax-cheatsheet 1
migrate tuple 1
migrate type 0
migrate variant 0
migrate what-and-why 0


#   /**
#    * TODO: Combine Basic Structures and Primitives into "Build in Data Types"
#    * TODO: Combine Options into built in data types.
#    * TODO: Combine Mutation into Let Bindings.
#    * TODO: Combine Recursion into Functions.
#    * TODO: Combine Destructuring into Pattern Matching.
#    * TODO: Combine 'articles-and-videos' 'community' 'events' 'extra-goodies' 'faq' into community.
#    * TODO: Combine installation and editor tooling
#    */
#   pages: {
#       /*"README": {
#         linkText: "ReadMe"
#     }, */
#
#     'what-and-why': {linkText: "Intro"},
#     'primitives': {linkText: "Primitives"},
#     'let-binding': {linkText: "Let"},
#     'type': {linkText: "Types"},
#     'record': {linkText: "Records"},
#     'variant': {linkText: "Variants"},
#     'destructuring': {linkText: "Destructuring"},
#     'option': {linkText: "Options"},
#       /*
#     'pattern-matching': {linkText: "Pattern Matching"},
#     'module': {linkText: "Modules"},
#     'external': {},
#     */
#     'function': {linkText: "Functions"},
#       /*
#     'loops': {},
#     'jsx': {},
#*/
#     'object': {linkText: "Objects"},
#     /* Tooling */
#     'editor-plugins': {},
#     'exception': {},
#     'installation': {linkText: 'Install'},
#     /* Community
#     'articles-and-videos': {linkText: "Articles"},
#     */
#     'community': {linkText: "Community"},
#     /*
#     'events': {},
#     'extra-goodies': {},
#     'faq': {},
#     */
#
#     /* Moved In New Docs Refactor: */
#     'mutable-bindings': {
#         hideInNav: true,
#       hideInSearch: true
#     },
#     /* Moved: */
#     'tuple': {
#         hideInNav: true,
#       hideInSearch: true
#     },
#     'string-and-char': {
#         hideInNav: true,
#       hideInSearch: true
#     },
#     'more-on-type': {
#         hideInNav: true,
#       hideInSearch: true
#     },
#     'null-undefined-option': {
#         hideInNav: true,
#       hideInSearch: true
#     },
#     'integer-and-float': {
#         hideInNav: true,
#       hideInSearch: true
#     },
#     'boolean': {
#         hideInNav: true,
#       hideInSearch: true
#     },
#     'if-else': {
#         hideInNav: true,
#       hideInSearch: true
#     },
#     'imperative-loops': {
#         hideInNav: true,
#       hideInSearch: true
#     },
#     'list-and-array': {
#         hideInNav: true,
#       hideInSearch: true
#     },
#     'mutation': {
#         hideInNav: true,
#       hideInSearch: true
#     },
#     /* Moved to BS:
#     'syntax-cheatsheet': {},
#     'pipe-first': {},
#     'quickstart-javascript': {},
#     'promise': {},
#     'interop': {},
#     'regular-expression': {},
#     'converting-from-js': {},
#     'libraries': {},
#     */
#
#     /* Deleted */
#     /* 'draft-blog-posts': {}, */
#
