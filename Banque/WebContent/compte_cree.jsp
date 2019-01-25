<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="main.SQLconnexion" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset = "UTF-8">
		<title> Cree_Compte</title>
		<link rel="stylesheet" type="text/css" media="screen" href="https://cdn.staticfile.org/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="css/compte_cree.css">
		<script type ="text/javascript">
		function inscription(){
			var nom = document.getElementById("nom").value;
			var prenom = document.getElementById("prenom").value;
			var datenais = document.getElementById("datenais").value;
			var adresse = document.getElementById("adresse").value;
			var tel = document.getElementById("tel").value;
			var mail = document.getElementById("mail").value;
			var pseudo = document.getElementById("pseudo").value;
			var motdepasse = document.getElementById("mdp").value;
			if(nom.length==0||nom.trim()==""){
				alert("le champ de nom est vide");
				return false;
				}
			if(prenom.length==0||prenom.trim()=="")
				{
				alert("le champ de prenom est vide");
				return false;
				}
			if(datenais.length==0||datenais.trim()==""){
					alert("le champ de date naissance est vide");
					return false;
					}
					
			if(adresse.length==0||adresse.trim()=="")
					{
					alert("le champ de adresse est vide");
					return false;
					}
			if(tel.length==0||tel.trim()==""){
				alert("le champ de téléphone est vide");
				return false;
				}
			if(mail.length==0||mail.trim()==""){
			alert("le champ de pseudo est vide");
			return false;
			}
			if(mail.indexOf('@')==-1){
			alert("le format mail est incorrect");
			return false;
			}
			if(pseudo.length==0||pseudo.trim()==""){
				alert("le champ de pseudo est vide");
				return false;
				}
			if(motdepasse.length==0||motdepasse.trim()=="")
			{
			alert("le champ de mot de passe est vide");
			return false;
			}
			return true;
		}
</script>
	</head>
    <body>
<div class="head" id="head">
		<div class="navigateur">
		<ul>
  			<li><a href="#home" class="active">Particuliers</a></li>  
    		<li><a href="#">Banque privée</a></li>
  			<li ><a href="#">Professionnels</a></li>
  			<li ><a  href="#">Entreprises</a></li>
  	 		<li ><a  href="#">Associations</a></li>
		</ul>
		</div>
		<div class="navigateur1">
		<ul>
			<li style='float:left'><div class="icon"><img src="images/icon.png"/></div></li>
			<li style='float:left'><h2><a href="http://localhost:8090/Banque/accueil.jsp">AEDI Banque</a></h2></li>
		</ul>
		</div>
 	 </div>
  
<div class="centre" id="centre">

	<section class="glisser">
        <div class="panel-compte" id="panel-compte">      
		<div class="compte">
			<div class="ins institre">
				<h2 class="p1">Créer Compte</h2>
			</div>
		<form action ="creer" method="post" onsubmit="return entree()">
		
	
			<div class="ins-p1">
				
				<select name= "typecompte" id ="typecompte" style="width:335px; height: 30px; margin-bottom:20px;">
				<%
    					request.setCharacterEncoding("UTF-8");
    					String req = "select * from TYPE_COMPTE";
    				try{
					        PreparedStatement ps = SQLconnexion.getInstance().creeConnexion().prepareStatement(req);
					        ResultSet rs = ps.executeQuery();
					        while(rs.next()){%>       
       							<option value='<%=rs.getInt("id_type_cpte")%>'><%=rs.getString("lib_type_cpte")%></option>
       						
       					 <% }
					   }catch(Exception e){}				
				%>
				</select>
			
			
			</div>
		
			
			<div class="ins-p1">
				
				<select name= "statut" id ="statut" style="width:335px; height: 30px; margin-bottom:20px;">
				<%
    					request.setCharacterEncoding("UTF-8");
    					String reqs = "select * from STATUT";
    				try{
					        PreparedStatement ps = SQLconnexion.getInstance().creeConnexion().prepareStatement(reqs);
					        ResultSet rs = ps.executeQuery();
					        while(rs.next()){%>       
       							<option value='<%=rs.getInt("id_statut")%>'><%=rs.getString("lib_statut")%></option><% 	
       							}
					   }catch(Exception e){}				
				%>
			</select>
			
			
		</div>
		
			<div class="ins-p2">
				<input type="submit" class="button" name ="valider" value="valider" onclick="return inscription()">
			</div>
			<div class="ins-p3"><a class="site" href="accueil_client.jsp">annuler</a></div> 
		</div>	
	</form>
	</div>	
		<div class="panel img">
        	<div class="Glisser"></div>
        <div class="panel-haut">
			<div class="panel-p" id="p-1"></div>
			<div class="panel-p" id="p-2"></div>
			<div class="panel-p" id="p-3"></div>
		</div>
    </div>
</section>	
</div>
<div class="foot" id="foot">		
  			<div class="foot1">
  				<div class="foot-text"><h3>&nbsp&nbspkilian.kalypso@gmail.com</h3></div>
  				<div class= "foot-site"><a href="#">Nos conseillers vous répondent par téléphone, chat, mail ou bien encore grâce à nos SAV Facebook et Twitter</a></div>
  			</div>
   		 	<div class="foot2">
   		 		<div class="foot-text"><h3>&nbsp&nbsp+33 6 35 51 22 44</h3></div>
  				<div class= "foot-site"><a href="#"><p>Nos conseillers vous répondent par téléphone, chat, mail ou bien encore grâce à nos SAV Facebook et Twitter</p></a></div>
  			</div>
  			<div class="foot3">
  				<div class="foot-text"><h3>&nbsp&nbspCONTACT</h3></div>
  				<div class= "foot-site"><a href="#"><p>Nos conseillers vous répondent par téléphone, chat, mail ou bien encore grâce à nos SAV Facebook et Twitter</p></a></div>
  			</div>
</div>
</body>
</html>