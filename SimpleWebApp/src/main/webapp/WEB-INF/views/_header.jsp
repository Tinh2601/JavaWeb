<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<div style="background: #E0E0E0; height: 70px; padding: 5px;">
  <div style="float: left">
     <h1>My Site</h1>
  </div>

  <div style="float: right; padding: 10px; text-align: right;">

     <!-- User store in session with attribute: loginedUser -->
     Hello <b>${loginedUser.userName}</b>
   <br/>
     Search <input name="search">
	<button type="submit" class="btn btn-secondary btn-number">
                                    <i class="material-icons">search</i>
                                </button>
  </div>

</div>