Org
javascript:(function(){var newSS, styles='* { background: #333333 ! important; color: #99CCFF !important } :link, :link * { color: #CCFF99 !important } :visited, :visited * { color: #FFCCFF !important }'; if(document.createStyleSheet) { document.createStyleSheet("javascript:'"+styles+"'"); } else { newSS=document.createElement('link'); newSS.rel='stylesheet'; newSS.href='data:text/css,'+escape(styles); document.getElementsByTagName("head")[0].appendChild(newSS); } })();

Monokai http://www.colourlovers.com/palette/1718713/Monokai
javascript:(function(){var newSS, styles='* { background: #272822 ! important; color: #66D9EF !important } :link, :link * { color: #A6E22E !important } :visited, :visited * { color: #F92672 !important }'; if(document.createStyleSheet) { document.createStyleSheet("javascript:'"+styles+"'"); } else { newSS=document.createElement('link'); newSS.rel='stylesheet'; newSS.href='data:text/css,'+escape(styles); document.getElementsByTagName("head")[0].appendChild(newSS); } })();

