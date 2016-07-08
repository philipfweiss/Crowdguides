$(document).ready(function() {

    // This divId/taskId will be used to differentiate between divs. ++divId will be used in ID numbers.
    var sectionId = 0;
    var taskId = 0;

    // This creates a new section when you click the "new section" button.
    $(document).on("click", '#new_section_button', function() {

        // Changes the options button HTML to delete the correct ID.
        var sectionOptionsButton = function(sectionId) {
            $(document).on("click", '#delete_section_' + sectionId, function() {
                console.log("hello? " + sectionId);
                $('#section-' + sectionId).remove();
            });
            return '<div class="dropdown option_button_dropdown"> <button class="btn btn-xs dropdown-toggle options_button" type="button" data-toggle="dropdown"> <span class="caret"></span></button> <ul class="dropdown-menu option_button_menu"> <li ><a class="option_button_delete" id="delete_section_'+ sectionId +'">Delete Section</a></li> </ul> </div>';
        };


        var taskOptionsButton = '<div class="dropdown option_button_dropdown"> <button class="btn btn-xs dropdown-toggle options_button" type="button" data-toggle="dropdown"> <span class="caret"></span></button> <ul class="dropdown-menu task_option_button_menu"> <li ><a class="option_button_delete" href="#">Delete Task</a></li> <li id=""><a class="option_button_add" href="#"> Add Task</li></ul> </div>';
        var addSection = '<div id="section-' + sectionId++ + '"' + '><div id="new_guide_title">New Section: '+ sectionOptionsButton(sectionId-1) + '</div>  <input class="new_guide_section_edit" placeholder="Section Title:"> <input class="new_guide_section_edit" placeholder="Section Description:"> <input class="new_guide_task_edit" placeholder="Add a Task..."> ' + taskOptionsButton + '</div>';
        $('#new_section_button').before(addSection);
    });

    // This creates a new task when you click the "+" button.
    $(document).on("click", ".new_task_button", function() {
        var newTask = '<input class="new_guide_task_edit" placeholder="Add a Task...">';
        $(this).before(newTask);
    });


    }
);
