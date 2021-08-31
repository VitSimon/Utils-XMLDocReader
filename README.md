# XMLDocReader

Simple document reader.

## How does it works

You will provide XML file in defined format and another content. After openning XML file in browser, the given XSLT template will render your XML in view with tree and content container like usual help or manual page. No iframe used.

## Features

- No iframe
- Tree view and content layout
- Bookmarks for XML defined headings in tree
- Collapsible tree nodes
- Images in tree nodes
- Links to external files in end of chapter
- Links to external files in tree nodes
- Inclusion of HTML files into output
- Data substructures automatically transfers to appropriate heading levels

## XML file structure
```
<?xml version="1.0" encoding="utf-8"?>
<?xml-stylesheet type="text/xsl" href="xmlFileTestTransf.xsl"?>
<content>
	<itemD>
		<title>Head1</title>
		<txt>text 1
			<b>be</b>
			<p>Lorem ipsum dolor sit amet
		</txt>
	</itemD>
	<itemD>
		<title>Second</title>
		<treeicon>User-Group-icon.png</treeicon>
		<txt>text 1
			<b>be</b>
			<p>Lorem ipsum dolor sit amet
		</txt>
		<embedfile>Include.html</embedfile>
		<itemD>
			<title>Sub</title>
			<txt>text 2</txt>
			<itemD>
				<title>SubSub</title>
				<txt>text 2</txt>
				<filepath>aa.txt</filepath>
				<embedfile>Include2.html</embedfile>
			</itemD>
		</itemD>
	</itemD>
	<itemD>
		<title>Next one</title>
		<txt>text</txt>
		<filepath>aa.txt</filepath>
		<filepath>aaa.txt</filepath>
		<treelink>
			<title>External XML file</title>
			<filepath>xmlFileTest2.xml</filepath>
		</treelink>
		<treelink>
			<title>Copy of External XML file</title>
			<filepath>xmlFileTest2.xml</filepath>
		</treelink>
	</itemD>
	<treelink>
		<title>Second link</title>
		<filepath>xmlFileTest2.xml</filepath>
	</treelink>
</content>
```

## XML file tags

| Item | Count | Parents | Value |
| --- | --- | --- | --- |
| content | 1 | [not  any] | main tag in XML |
| itemD | * | content, itemD | item data descriptor |
| title | 1 | itemD, treelink | Title of chapter or item |
| txt | 0..1 | itemD | Data of chapter - plain text or html content |
| treeicon | 0..1 | itemD | relative path to your XML document to image for tree view item |
| filepath | 0..* | itemD | relative path to your XML document to external resource (hyperlink will be created in tail of chapter) |
| filepath | 1 | treelink | relative path to your XML document to external resource (sub item of tree node will be created) |
| embedfile | 0..* | itemD | relative path to your XML document to external HTML file (contents of HTML file will be printed to output - with use of JavaScript) |
| treelink | 0..* | content, itemD | definition of tree link item. Sub items are specifying more details |

## Possible limitations and problems

- JavaScript is used in HTML output.
- If documentation will not read, then probably CORS restrictions are defined.

  - Firefox:
  > Address bar: 
  about:config
  > 
  > search:
  privacy.file_unique_origin
  > 
  > set to:
  false
  
  - Chrome:
  > Run in CLI:
  > chrome.exe  --disable-site-isolation-trials --disable-web-security --user-data-dir="D:\temp"

## Used resources

- [7.css project][7css]


[7css]: https://khang-nd.github.io/7.css "7.css CSS and man pages"