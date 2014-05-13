package cinemaweb

class LoginTagLib {

	static namespace = "lt"

	//Div que mostrara el login del usuario en la web (no pude hacer funcionar esto y lo hice directamente en el layout, por ahi lo retomo)
	def loginToggle = {

		out << "<div>"
		if (session.usuario){ 
			out << "<span style='float:left'>"
			out << "Bienvenido ${session.usuario}."
			out << "</span><span style='float:right;margin-right:10px'>"
			out << "<a href='${createLink(controller:'usuario', action:'logout')}'>"
			out << "Logout </a></span>"
		}
		else{
			out << "<span style='float:right;margin-right:10px'>"
			out << "<a href='${createLink(controller:'usuario', action:'login')}'>"
			out << "Login </a></span>"
		}
		out << "</div><br/>"
	}
}