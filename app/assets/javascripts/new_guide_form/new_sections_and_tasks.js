$(document).ready(function() {
    var Guide = {title: "", description: "", sections: []}; // Guide.sections = [{id: 1, tasks: [Tasks}, {id: 2, tasks: [Tasks]}]...
                                                            // Task :: {}
    var sectionNum = 0;
    var createSection;
    var deleteSection;
    var createTask;
    var deleteTask;


    $(document).on("click", "#new_section_button", function() {
        createSection();
    });

    createSection = function() {
        // Find the max key in the sections array and add 1
        var max = sectionNum++;

        // Then, create a section with that ID
        console.log(max);
        Guide.sections.push({id: max, tasks: []});

        var optionsButton = '<div class="dropdown intro_dropdown"> <button class="btn btn-xs dropdown-toggle intro_form_button" type="button" data-toggle="dropdown"> <span class="caret"></span></button> <ul class="dropdown-menu intro_form_menu"> <li ><a class="option_button_delete" id="delete_section_' + max + '">Delete Section</a></li> </ul> </div>';
        var addSection = '<div id="section_' + max + '"><div id="new_guide_title">New Section: '+ optionsButton + '</div>  <input class="new_guide_section_edit" placeholder="Section Title:"> <input class="new_guide_section_edit" placeholder="Section Description:"> <input class="new_guide_task_edit" placeholder="Add a Task..."> <button type="button" class="btn btn-xs btn-danger new_task_button" id="new_task_button"> Delete </button><div> <button type="button" class="btn btn-xs btn-success new_task_button" id="new_task_button"> + </button></div></div>';
        deleteSection(max); // Adds the onclick delete section handler
        $('#new_section_button').before(addSection);
    };


    deleteSection = function(sectionId) {
        // Delete a section given its section ID;
        $(document).on("click", "#delete_section_" + sectionId, function () {
            for(var i = 0; i<Guide.sections.length; i++) {
                if(Guide.sections[i].id === sectionId) {
                    Guide.sections.splice(i,1);
                    console.log("Currently: " + Guide.sections.length);
                }
            }
            $("#section_" + sectionId).remove();

        });
    };

    createTask = function(sectionId) {
        // Finds the max task_id in the section and adds 1
    };

    deleteTask = function(sectionId, taskId) {
        // Deletes a task with the largest section ID.
    };


});
