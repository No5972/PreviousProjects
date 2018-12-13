# Student Information Management System SSM Remix

This project what previous Student Information Management System remixed with SSM framework. All project codes are re-written with SSM framework. The page type, business logics, and UI are largely the same with before, but there are also some large scale modifications to the operation pages. The major modifications are: Various categories of data's CRUD have been integrated into single management pages (student management, course management, grade management). The CUD operations can be directly clicked to operation in the query UI. The dialog box is directly poped up for operation after clicking. The dialog box has adopted the "draggable" in jQuery UI in order to realize the mouse dragging of the dialog box and avoid dialog box's occluding the data to browse. After managers's clicking log out, previous management pages not closed will be no longer usable and require re-login. The SQL injection bug of the manager login has been fixed. The database used by this project is MySQL. The entire project's business logics, page handlers, persistence layer are devoloped by myself. 

Now supports Maven.

(AudioCMS currently does not support Maven 'cause Baidu Aip conflicts with Maven and SpringMVC 
[![](https://img.shields.io/github/issues/detail/title/Baidu-AIP/java-sdk/22.svg)](https://github.com/Baidu-AIP/java-sdk/issues/22)
)