<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 8/1/2023
  Time: 8:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/signUp.css">
    <script src="js/vendor/jquery-2.2.4.min.js"></script>
    <title>Add New Educational Qualifications</title>
    <style>
        .form-box {
            background-color: #7b6e9b;
            padding: 50px;
            margin-top: 50px;

        }
    </style>

    <script>
        $(document).ready(function() {
            // Disable the remove button if there's only one set of fields initially
            updateRemoveButtons();

            // Add new set of fields when the plus button is clicked
            $('#addFieldButton').click(function() {
                var fields = $('.educationFields').first().clone();
                fields.find('input[type="date"]').val(''); // Clear the date inputs
                fields.find('select').prop('selectedIndex', 0); // Reset select dropdowns
                // fields.append('<button type="button" class="removeFieldButton">-</button>'); // Add remove button
                $('#fieldsContainer').append(fields);

                // Update remove buttons after adding new fields
                updateRemoveButtons();
            });

            // Remove the respective set of fields when the remove button is clicked
            $(document).on('click', '.removeFieldButton', function() {
                $(this).closest('.educationFields').remove();

                // Update remove buttons after removing fields
                updateRemoveButtons();
            });

            function updateRemoveButtons() {
                var fieldCount = $('.educationFields').length;
                $('.removeFieldButton').prop('disabled', fieldCount <= 1);
            }
        });

        function saveNewQualifications(){
            document.qualificationForm.action = "saveNewQualification.htm";
            document.qualificationForm.submit();

        }
    </script>
</head>
<body>

<form name="qualificationForm" method="POST" action="">
    <div class="container form-box" style="width: auto;">
    <div class="box">
        <h2 class="box-title">Educational Background</h2>

        <fieldset>
            <div id="fieldsContainer">

                <div class="educationFields">
                    <div class="box">
                        <span><label for="qualification">Type of Educational qualification:<button type="button" class="removeFieldButton" style="color: #0a0a23" disabled>-</button></label></span>

                        <select name="qualification" id="qualification" style="color: #0a0a23">
                            <option value="0">Select Qualification</option>
                            <option value="1">Certificate</option>
                            <option value="2">Diploma</option>
                            <option value="3">Higher Diploma</option>
                            <option value="4">Degree</option>
                            <option value="5">Masters</option>
                            <option value="6">PHD</option>
                        </select>
                        <label for="educationField">Field of Study:</label>
                        <select name="educationField" id="educationField" style="color: #0a0a23">
                            <option value="">Select Field</option>
                            <option value="engineering">Engineering</option>
                            <option value="medicine">Medicine</option>
                            <option value="business">Business</option>
                            <option value="computer science">Computer Science</option>
                            <option value="biology">Biology</option>
                            <option value="chemistry">Chemistry</option>
                            <option value="physics">Physics</option>
                            <option value="mathematics">Mathematics</option>
                            <option value="psychology">Psychology</option>
                            <option value="education">Education</option>
                            <option value="art">Art</option>
                            <option value="music">Music</option>
                            <option value="history">History</option>
                        </select>

                        <label>Start Date: <input type="date" name="startDate" required></label>
                        <label>End Date: <input type="date" name="endDate" required></label>

                        <label for="StatusType">Status:</label>
                        <select name="StatusType" id="StatusType" style="color: #0a0a23">
                            <option value="select">Select</option>
                            <option value="complete">Complete</option>
                            <option value="not complete">Not complete</option>
                            <option value="pending">Pending</option>
                        </select>
                        <label>Special Note: <textarea name="description" rows="3" cols="5"></textarea></label>


                    </div>
                </div>


            </div>

            <button type="button" id="addFieldButton" style="color: #0a0a23">+</button>


        </fieldset>
    </div>
    </div>
    <input id="saveQuaBtn" type="button" value="Save" onclick="saveNewQualifications()" />

</form>

</body>
</html>
