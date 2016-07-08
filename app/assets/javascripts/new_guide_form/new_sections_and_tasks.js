$(document).ready(function() {
    var Guide = {title: "", description: "", sections: []}; // The section array is [[1,[Tasks]], [2, [Tasks]]] etc...
    var createSection;
    var deleteSection;
    var createTask;
    var deleteTask;


    $(document).on("click", "#new_section_button", function() {
        createSection();
    });


    createSection = function() {
        // Find the max key in the sections array and add 1
        var max = 0;
        for(var section in Guide.sections) {
            if(section[0] != null && section[0] > max) {
                max = section[0];
            }
        }

        // Then, create a section with that ID
        Guide.sections.push([max+1, []]);
        console.log("Shit!");
        $('#new_section_button').before('<div>Hello!</div>');
    };


    deleteSection = function(sectionId) {
       // Delete a section given its section ID;
    };

    createTask = function(sectionId) {
        // Finds the max task_id in the section and adds 1
    };

    deleteTask = function(sectionId, taskId) {
        // Deletes a task with the largest section ID.
    };


});
