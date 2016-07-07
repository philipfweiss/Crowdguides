$(document).ready(function() {

    $('#new_section_button').on("click", function() {
        var addSection = '<div><div id="new_guide_title">New Section:</div> <input class="new_guide_section_edit" placeholder="Section Title:"> <input class="new_guide_section_edit" placeholder="Section Description:"> <input class="new_guide_task_edit" placeholder="Add a Task..."> <button type="button" class="btn btn-xs btn-success new_task_button" id="new_task_button"> + </button> </div>';
        $('#new_section_button').before(addSection);
    });

    $('.new_task_button').on("click", function() {
        var newTask = '<input class="new_guide_task_edit" placeholder="Add a Task...">';
        $(this).before(newTask);
    });


    }
);
