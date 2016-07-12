// Code currently unused

// This is called on keypress every time a key is pressed



var renderGuide = function(divId, myGuide) {

    var inputDiv = $(divId);
    inputDiv.empty()

    // iterate through the guide object and add the fields to inputDiv

    // Add Title
    var titleText = '<div class="preview_form_centered" id="guide_title_text"> '+ Guide.title +' </div>';
    inputDiv.append(titleText);
    $('#guide_title_text').text(myGuide.title);


    // Add Description
    var descriptionText = '<div class="preview_form_description" id="guide_description_text"></div>';
    inputDiv.append(descriptionText);
    $('#guide_description_text').text(myGuide.description);


    // Add all section headers
    var renderSection = function(section) {
        var sectionId = section.id;

        // Add section wrapper
        var sectionWrapper = '<div id="section_' + sectionId + '_wrapper' + '"class="preview_form_section"></div>';
        inputDiv.append(sectionWrapper);
        var thisSectionDiv = $('#section_' + sectionId + '_wrapper');

        // Add Section Title
        var sectionTitleText = '<div class="preview_form_section_task_header" id="section_' + sectionId + '_title' + '"></div>';
        thisSectionDiv.append(sectionTitleText);
        $('#section_'+ sectionId + '_title').text(section.title);

        // Add Section Description
        var sectionDescriptionText = '<div class="preview_form_section_description" id="section_' + sectionId + '_description' + '"></div>';
        thisSectionDiv.append(sectionDescriptionText);
        $('#section_'+ sectionId + '_description').text(section.description);


    };

    for(var i  = 0; i<myGuide.sections.length; i++) {
        renderSection(myGuide.sections[i]);

    }



};