$(document).ready(function() {
    var Guide = {title: "", description: "", sections: []}; // Guide :: {title: "", description: "", sections: []}
                                                            // Sections :: {id: int, title: "", description: "", tasks: []}
                                                            // Tasks :: {id: int, text: "", advice: []}
                                                            // Advice :: {type: "", id: ""}
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
        Guide.sections.push({id: max, title: "", description: "", tasks: []});

        // Render the HTML for the section on to the page // Can be refactored?
        var optionsButton = '<div class="dropdown intro_dropdown"> <button class="btn btn-xs dropdown-toggle intro_form_button" type="button" data-toggle="dropdown"> <span class="caret"></span></button> <ul class="dropdown-menu intro_form_menu"> <li ><a class="option_button_delete" id="delete_section_' + max + '">Delete Section</a></li> </ul> </div>';
        var addSection = '<div id="section_' + max + '"><div id="new_guide_title">New Section: '+ optionsButton + '</div>  <input class="new_guide_section_edit" placeholder="Section Title:"> <input class="new_guide_section_edit" placeholder="Section Description:"> <div> <button type="button" class="btn btn-xs btn-success new_task_button" id="new_task_button_'+ max +'"> Add Task </button></div></div>';
        deleteSection(max); // Adds the onclick delete section handler

        // Adds section when
        $('#new_section_button').before(addSection);

        // Add new task when task button is clicked
        $(document).on("click", '#new_task_button_'+max, function() {
            createTask(max);
        });

    };


    deleteSection = function(sectionId) {
        // Delete a section given its section ID;
        $(document).on("click", "#delete_section_" + sectionId, function () {
            for(var i = 0; i<Guide.sections.length; i++) {
                if(Guide.sections[i].id === sectionId) {
                    Guide.sections.splice(i,1);
                    $("#section_" + sectionId).remove();
                }
            }

        });
    };

    createTask = function(sectionId) {
        var taskMax = -1;
        // Finds the max task_id in the section and adds 1
        for (var i = 0; i<Guide.sections.length; i++) {
            if(Guide.sections[i].id === sectionId) {

                // Check for the largest task and then make one value one higher.
                for(var k = 0; k<Guide.sections[i].tasks.length; k++) {
                    if(Guide.sections[i].tasks[k].id > taskMax ) {
                        taskMax = parseInt(Guide.sections[i].tasks[k].id);
                    }
                }

                // Add a new task with the new Task Id that is higher than all previous
                taskMax = taskMax+1;
                Guide.sections[i].tasks.push({id: taskMax, text: "", advice: []});

                // Render the html for the task on to the page // Should be refactored?
                var taskField = '<input class="new_guide_task_edit" placeholder="Add a Task..."> <button type="button" class="btn btn-xs btn-danger new_task_button" id="delete_section_'+sectionId + "_task_" + taskMax + '"> Delete </button>';
                $('#new_task_button_' + sectionId).before('<div id="section_'+ sectionId + "_task_" + taskMax + '">'+ taskField + '</div>');

                // Add task delete handler to task
                deleteTask(sectionId, taskMax);
        }
        }
    };

    deleteTask = function(sectionId, taskId) {
        // Deletes a task with the largest section ID.
        $(document).on("click", "#delete_section_" + sectionId + "_task_" + taskId, function () {
            for(var i = 0; i<Guide.sections.length; i++) {
                if(Guide.sections[i].id === sectionId) {
                    for(var j = 0; j<Guide.sections[i].tasks.length; j++) {
                        console.log("hi: " + Guide.sections[i].tasks[j].id);
                        if(Guide.sections[i].tasks[j].id === taskId) {
                            // Delete task from guide object.
                            Guide.sections[i].tasks.splice(j,1);


                            // Then, remove the HTML
                            $("#section_" + sectionId + "_task_" + taskId).remove();

                            console.log("Current this section has: " + Guide.sections[i].tasks.length + " tasks");

                        }
                    }
                }
            }

        });
    };

});
