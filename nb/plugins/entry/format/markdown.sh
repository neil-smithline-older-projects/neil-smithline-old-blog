# NanoBlogger plugin to render Markdown format entries
# Markdown is documented and implemented at
#   <URL:http://daringfireball.net/projects/markdown/>

: ${MARKDOWN_CMD:=markdown}
: ${MARKDOWN_OPTS:= }

# most markdown implementations expect input right away, so we always pipe to it
# first to avoid hangups
echo . | nb_null $MARKDOWN_CMD && MARKDOWN_INPATH=true
	
if [ "$MARKDOWN_INPATH" = "true" ]; then
	# nb_msg "$plugins_entryfilteraction `basename $nb_plugin` ..."
	NB_MetaBody=$(echo "$NB_MetaBody" | ${MARKDOWN_CMD} ${MARKDOWN_OPTS})
else
	die "$nb_plugin: $plugins_abort"
fi

