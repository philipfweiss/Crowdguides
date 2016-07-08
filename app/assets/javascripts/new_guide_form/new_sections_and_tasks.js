$(document).ready(function() {

    // This creates a new section when you click the "new section" button.
    $(document).on("click", '#new_section_button', function() {
        var optionsButton = '<div class="dropdown intro_dropdown"> <button class="btn btn-xs dropdown-toggle intro_form_button" type="button" data-toggle="dropdown"> <span class="caret"></span></button> <ul class="dropdown-menu intro_form_menu"> <li ><a class="intro_form_blockers" href="#">Blockers: 0</a></li> <li ><a class="intro_form_warnings" href="#">Warnings: 0</a></li> <li ><a class="intro_form_tips" href="#">Tips: 0</a></li> </ul> </div>';
        var addSection = '<div><div id="new_guide_title">New Section: '+ optionsButton + '</div>  <input class="new_guide_section_edit" placeholder="Section Title:"> <input class="new_guide_section_edit" placeholder="Section Description:"> <input class="new_guide_task_edit" placeholder="Add a Task..."> <button type="button" class="btn btn-xs btn-success new_task_button" id="new_task_button"> + </button> </div>';
        $('#new_section_button').before(addSection);
    });

    // This creates a new task when you click the "+" button.
    $(document).on("click", ".new_task_button", function() {
        var newTask = '<input class="new_guide_task_edit" placeholder="Add a Task...">';
        $(this).before(newTask);
    });


    }
);
