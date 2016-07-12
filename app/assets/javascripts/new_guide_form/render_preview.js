$(document).ready(function() {
    $(document).on("click", '#content_preview', function() {
        var title = '## ' + $("#new_guide_title_edit").val();
        if(title.length > 3) {
            title+= ' \n' + " ---------- " +'\n'; // Adds underline if there is a title
        }
        var description = '#### ' + $('#new_guide_description_edit').val() + '\n\n';
        if(description.length > 3) {
            description+= ' \n' + " ---------- " +'\n'; // Adds underline if there is a description
        }

        var md_content = '\n\n' + $("#new_guide_content_edit").val();
        var html_content = markdown.toHTML( title+description+md_content );
        $('#preview_tab').html(html_content);
    });

});