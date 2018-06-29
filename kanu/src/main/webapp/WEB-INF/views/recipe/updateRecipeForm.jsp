<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<form action="./insertRecipe" method="post">
		<div class="form-group">
			<label for="RecipeNum">메뉴번호 </label> 
			<input type="text" class="form-control" name="menuId" value="${recipeOne.menuId }" >
		</div>
		
		<div class="form-group">
			<label for="RecipeProd">제품명</label> <input type="text" class="form-control" name="productId" value="${recipeOne.productId }">
		</div>
		<div class="form-group">
			<label for="RecipeAmount">재료사용량</label> <input type="text" class="form-control" name="materialAmount" value="${recipeOne.materialAmount }">
		</div>
	  	
		<input type="submit" class="btn btn-primary" value="변경">
		<input type="reset" class="btn btn-primary" value="초기화">
	</form>



</body>
</html>