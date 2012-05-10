# NanoBlogger Disqus Comment Plugin
# Entry plugin to add appropriate code to the end of an entry.

# COMMENTS_DISQUS=1

echo "Disqus Comment Plugin Test"

if [ "$COMMENTS_DISQUS" = 1 ]; then
    # absolute_orig=$ABSOLUTE_LINKS
    # ABSOLUTE_LINKS=1
    cat <<EOF

     <!-- Disqus Code-->
     <div id="disqus_thread"></div>
     <script type="text/javascript">
       /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
       var disqus_shortname = 'mygeekdom'; // required: replace example with your forum shortname
       var disqus_identifier ='$NB_EntryPermalink'; // required
       var disqus_url =  '${BLOG_URL}/${ARCHIVES_DIR}$NB_EntryPermalink'; // required
       
       /* * * DO NOT EDIT BELOW THIS LINE * * */
       (function() {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
              (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
          })();
        </script>
        <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
        <a href="http://disqus.com" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>
        <!-- End Of Disqus Code-->

EOF

fi
