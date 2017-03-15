<%--
 * footer.jsp
 *
 * Copyright (C) 2014 Paperbet S.A.
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<hr />

<script type="text/javascript">
$(document).ready(function(){
    $("[rel=tooltip]").tooltip({ placement: 'top'});
});
</script>

<nav class="navbar navbar-inverse" role="navigation">
	<div class="container-fluid">
		<p class="navbar-text navbar-left">
			<a href="http://www.juegoseguro.es/" class="no-text left" target="_blank">
				<img src="http://cmscdn.staticcache.org/assets/image/0008/22013/juego-seguro.jpg">
			</a>
		</p>
		<p class="navbar-text navbar-left">
			<a class="terms" href="#TermsAndConditions"  data-toggle="modal">
 				 <spring:message code="master.footer.termstag"/>
			</a>
		</p>
		
		<p class="navbar-text navbar-right">Copyright &copy; Paperbet S.A. </p>
		<p class="navbar-text navbar-right">
		<ul class="nav navbar-nav navbar-right">
        <li class="dropup">
          <a href="#" class="dropup-toggle" data-toggle="dropdown"><spring:message code="master.page.actLanguage" /><b class="caret"></b></a>
          <ul class="dropdown-menu">
           <li>
				<a class="terms" href="?language=eu" rel="tooltip" title="<spring:message code="master.page.basque" />" >
				Euskara
				</a>
			</li>
           <li>
				<a class="terms" href="?language=ga" rel="tooltip" title="<spring:message code="master.page.galician" />" >
				Galego
				</a>
			</li>
            <li>
				<a class="terms" href="?language=ca" rel="tooltip" title="<spring:message code="master.page.catalan" />" >
				Catal�
			</a>
            </li>
            <li>
				<a class="terms" href="?language=es" rel="tooltip" title="<spring:message code="master.page.spanish" />" >
				Espa�ol
				</a>
			<li>
            <a class="terms" href="?language=en" rel="tooltip" title="<spring:message code="master.page.english" />" >
				English
				</a>
			</li>
            
          </ul>
        </li>
      </ul>
	</p>		
	</div>
</nav>

<!-- Modal -->
<div class="modal fade" id="TermsAndConditions" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel"><spring:message code="master.footer.termstag"/></h4>
      </div>
      <div class="modal-body">
        	<textarea name="text" rows="20" readonly="readonly" style="width: 100%;">
			T�RMINOS Y CONDICIONES DE USO DE BET-ME (pendiente de revisi�n antes de salir al mercado)
			
			
1. INTRODUCCI�N: DEFINICIONES CLAVE Y CONTENIDO DE LOS T�RMINOS DE USO
1.1 En los presentes t�rminos y condiciones se utilizan las siguientes definiciones:

T�rminos de los Bonos hace referencia a los t�rminos y condiciones y/o las reglas aplicables a promociones, bonos y ofertas especiales que puedan ser de aplicaci�n en su momento a cualquier parte de los Servicios

Sus Datos de Contacto ser�n los definidos en el p�rrafo 4.5.

T�rminos de Descarga hace referencia a los posibles t�rminos y condiciones de uso para usuario final que tendr� que aceptar adicionalmente como parte del proceso de descarga y/o instalaci�n de cualquier tipo de software que pudiera tener que descargar para utilizar la P�gina Web, incluido el Contrato de Licencia para Usuario Final de Paperbet, que podr� consultar en el Anexo de los presentes T�rminos y Condiciones Generales.

T�rminos Generales hace referencia a los t�rminos y condiciones que se especifican en el presente documento.

Pol�tica de Privacidad hace referencia a la pol�tica de privacidad de Bet-me a la que se puede acceder a trav�s del enlace Pol�tica de privacidad.

Reglas significa las Reglas de Apuestas y las Reglas del Juego aplicables espec�ficamente al tipo de apuesta y/o juego correspondiente, seg�n se definen con m�s detalle en los puntos 1.3.1. y 1.3.2.

Servicios hace referencia a los servicios prestados en su momento por Paperbet a trav�s de la P�gina Web

T�rminos de Uso comprende (a) los T�rminos Generales, (b) la Pol�tica de Privacidad y (c), si procede de conformidad con la cl�usula 1.3., las Reglas y T�rminos de Bonos aplicables a los Servicios que usted est� utilizando y (d) los T�rminos de Descarga.

P�gina Web hace referencia a la p�gina www.betme.es o a cualquier p�gina o parte de la misma que la sustituya en su momento

Bet-Me pertenece a Paperbet SA (pudiendo ser usados indistintamente seg�n sea el caso de conformidad con lo estipulado en la cl�usula 2 de los presentes T�rminos).

1.2 Al utilizar y/o visitar cualquier secci�n de la P�gina Web, o al abrir una cuenta con la empresa Paperbet correspondiente a trav�s de la P�gina Web, usted acepta expresamente los T�rminos y Condiciones de Uso y, en consecuencia, (a) acepta utilizar el medio de comunicaci�n electr�nica para formalizar contratos, y (b) renuncia a cualquier derecho o requisito aplicable que implique tener que incluir su firma original de pu�o y letra, en la medida en la que la legislaci�n aplicable lo permita. Los T�rminos de Uso no afectan a los derechos que le confiere la ley.

1.3 Adem�s, cada vez que usted participe en un juego o realice una apuesta utilizando los Servicios, se compromete a respetar:

1.3.1 las Reglas para Apuestas Deportivas que figuran en el Libro de apuestas deportivas de Bet-me, al que se puede acceder a trav�s de la pesta�a de Ayuda (las Reglas de Apuestas);

1.3.2 Las Reglas aplicables a cada juego en concreto (Reglas del Juego), que figuran en la pesta�a de Ayuda o de Reglas correspondiente;

1.3.3 los T�rminos de los Bonos; y

1.3.4 los T�rminos de Descarga.

1.4 El texto original de los T�rminos de Uso est� redactado en espa�ol e ingl�s. No obstante, toda interpretaci�n del mismo se har� de conformidad con la versi�n espa�ola, que prevalecer� en caso de controversia.

1.5 En el caso de que se produzca alg�n conflicto o contradicci�n entre las partes que integran los T�rminos de Uso que constituyen su contrato con Bet-me, el orden de prioridad ser� el siguiente:

1.5.1 Los T�rminos de los Bonos;

1.5.2 Las Reglas de Apuestas;

1.5.3 Las Reglas del Juego;

1.5.4 Los T�rminos Generales;

1.5.5 La Pol�tica de Privacidad; y

1.5.6 Los T�rminos de Descarga.

1.6 Le rogamos que lea atentamente los presentes T�rminos de Uso antes de aceptarlos. Una vez los haya aceptado expresamente, imprima una versi�n de los mismos y gu�rdelos junto con todos los correos electr�nicos de confirmaci�n, t�rminos adicionales, datos de transacciones, reglas del juego, reglas de trato justo y los m�todos de pago aplicables al uso que haga de la P�gina Web. Bet-me guardar� todos los T�rminos de Uso que usted haya aceptado durante un periodo de seis a�os tras la cancelaci�n de su cuenta. Durante el periodo expresado, sus datos personales permanecer�n bloqueados, y una vez transcurrido dicho periodo de seis a�os, ser�n eliminados. En nuestra Pol�tica de Privacidad podr� obtener m�s informaci�n sobre la protecci�n de datos. Cabe comentar que los T�rminos de Uso quedan sujetos a cambios, tal y como se estipula en la cl�usula 3 siguiente.

1.7 En el caso de que no acepte los T�rminos de Uso no podr� abrir ninguna cuenta ni continuar utilizando su cuenta, en su caso.

1.8 Los T�rminos de Uso se aprobaron el 1 de Abril de 2014.


T�RMINOS GENERALES
2. PARTES DE BET-ME

2.1 Los presentes T�rminos de Uso tendr�n que ser aceptados tanto por usted como por la siguiente empresa del grupo Bet-me: Paperbet (en lo sucesivo Bet-me). Bet-me, %lt; Pendiente de inscripcion %gt; con n�mero de sociedad N/D, con domicilio social en Avenida de Reina Mercedes S/N, es titular de seis licencias otorgadas por las Autoridades espa�olas competentes en materia de juegos.

 2.2 La P�gina Web, las cuotas y los precios que en ella se indican, junto con los T�rminos de Uso, est�n traducidos a varios idiomas, con el objetivo de que puedan ser utilizados por los ciudadanos que hablen esos idiomas.

2.3 Toda referencia contenida en los T�rminos de Uso a nosotros o nuestro/a/os/as se entender� como referencias a Bet-me.

2.4 Una vez haya aceptado expresamente los presentes T�rminos de Uso y abierto una nueva cuenta, registr�ndose como usuario/cliente, podr� acceder y utilizar la P�gina Web y los Servicios con arreglo a los t�rminos y condiciones contenidos en el presente contrato. Adem�s, nos comprometemos a permitirle acceso a los servicios de juegos correspondientes conforme a las condiciones estipuladas en el presente contrato. En particular, cuando usted utilice la P�gina Web y los Servicios, en tanto que usuario/cliente, contar� con los siguientes derechos:

a) Derecho a obtener informaci�n clara y correcta sobre las reglas aplicables a cualquiera de los juegos en los que participe como parte de los servicios ofrecidos a trav�s de la P�gina Web, as� como cualquier otra informaci�n relativa a los servicios correspondientes (importes apostados, saldos de las cuentas o el tiempo disponible de juego, tal y como se explica m�s adelante).

b) Derecho a obtener los premios que le puedan corresponder con arreglo a las reglas aplicables del juego en el que participe como parte de los servicios de juego, de conformidad con las condiciones estipuladas en el presente contrato y con las reglas aplicables al juego en cuesti�n.

c) Derecho a formalizar, ante Bet-me o la Comisi�n Nacional del Juego, cualquier queja o reclamaci�n que estime necesaria con relaci�n al uso que haga de los correspondientes servicios de juegos.


3. CAMBIOS EN LOS T�RMINOS DE USO

3.1 Los presentes T�rminos de Uso pueden sufrir cambios por varias razones, entre otras, razones comerciales, con el objetivo de cumplir con la legislaci�n aplicable, o con las instrucciones, pautas o recomendaciones dictadas por alguna entidad reguladora, o por motivos de atenci�n al cliente.

3.2 En el caso de que se produzca alg�n cambio en los presentes T�rminos de Uso, se le notificar� por los medios estipulados en el punto 3.3. y se requerir� su aceptaci�n expresa de los mismos para que pueda acceder a los servicios de juegos que prestamos.

3.3 Se le notificar� todo cambio en los presentes T�rminos de Uso a trav�s de cualquier medio de notificaci�n que consideremos oportuno, entre otros:

3.3.1 correo electr�nico (a las direcciones de correo electr�nico que nos haya facilitado previamente, en su caso);

3.3.2 env�o de un mensaje a su Buz�n de entrada en la P�gina Web; o

3.3.3 un aviso en la P�gina Web,

y le pediremos que acepte los nuevos T�rminos de Uso haciendo clic sobre s� o acepto, seleccionando la casilla correspondiente, o mediante cualquier otro medio de confirmaci�n similar. En el caso de que no acepte expresamente los cambios realizados en los T�rminos de Uso, no podr� continuar utilizando los servicios de juegos que ofrecemos ni la P�gina Web.


4. APERTURA DE UNA CUENTA

4.1 Para realizar una puesta o participar en un juego utilizando los Servicios, es necesario abrir una cuenta con Bet-me (su Cuenta).

4.2 Para abrir una cuenta y utilizar los Servicios, puede optar por:

4.2.1 ponerse en contacto con el servicio de atenci�n al cliente;

4.2.2 hacer clic en la secci�n Registrarse de la P�gina Web y seguir las instrucciones que aparecen en pantalla;

4.2.3 utilizar cualquier otro medio para apertura de cuentas que ponga a su disposici�n en su momento Bet-me.

4.3 Su cuenta ser� administrada por Bet-me.

4.4 Para abrir una cuenta le pediremos que nos facilite una serie de informaci�n personal, como su nombre, su fecha de nacimiento y los datos de contacto: direcci�n, n�mero de tel�fono y direcci�n de correo electr�nico (sus Datos de Contacto). Podr� actualizar sus datos de contacto siempre que as� lo desee poni�ndose en contacto con nuestro equipo de atenci�n al cliente o a trav�s de la secci�n de gesti�n de Mi Cuenta de la P�gina Web, o a trav�s de cualquier medio que en su momento ponga a su disposici�n Bet-me.

4.5 Si no desea que sus Datos de Contacto puedan ser utilizados por nosotros o por nuestros socios comerciales para ponerse en contacto con usted y hacerle llegar informaci�n con fines comerciales relativa a terceros o a nuestros productos y servicios o a aqu�llos de nuestros socios, h�ganoslo saber seleccionando la casilla correspondiente, tal y como se le indicar� al abrir una cuenta en la P�gina Web, o comunic�ndoselo al equipo de atenci�n al cliente.

4.6 Al abrir su cuenta declara y garantiza:

4.6.1 que entiende y acepta el hecho de que, al usar nuestros servicios, podr� tanto ganar como perder dinero;

4.6.2 que (a) es mayor de edad y que (b) tiene la edad m�nima legal obligatoria para poder participar en juegos de conformidad con la legislaci�n aplicable en su jurisdicci�n (la Edad m�nima legal);

4.6.3 que los juegos de azar no son ilegales en el territorio en el que reside;

4.6.4 que tiene capacidad legal suficiente para poder contraer contratos;

4.6.5 que no ha sido excluido previamente de este tipo de actividades de juegos ni tiene problemas de adicci�n al juego;

4.6.6 que no ha tenido ya una cuenta que hayamos procedido a cerrar en su momento con arreglo a lo estipulado en las cl�usulas 11 (Colusi�n, Trampas, Fraude y Actividades Delictivas), 20 (Incumplimiento de los T�rminos de Uso) o por petici�n suya conforme a lo estipulado en la cl�usula 32.1. (Juego Responsable).

4.7 Para registrarse tendr� que utilizar su propio nombre y facilitar datos personales y de contacto reales. Se trata de una cuenta personal que no podr� ser duplicada ni compartida por otra persona, familiar, persona con la que conviva, direcci�n (postal o de IP), ni por ning�n entorno en donde se compartan ordenadores (por ejemplo: escuelas, lugar de trabajo, bibliotecas p�blicas, etc.), ordenador (o cualquier otro dispositivo similar de acceso), ni cuenta a los efectos de utilizar los Servicios. Usted es el titular �nico y exclusivo de su cuenta, cuyo uso no podr� ser transferido ni cedido a favor de terceros. De conformidad con la legislaci�n vigente, solamente podr� ser titular de una cuenta activa.

4.8 Que por la naturaleza de nuestra p�gina web, cualquier apuesta puede ser cancelada si se conviene seg�n lo estipulado en las cl�usulas 11 (Colusi�n, Trampas, Fraude y Actividades Delictivas), 20 (Incumplimiento de los T�rminos de Uso), siendo esto causa de restitucion por parte de Bet-me del dinero invertido no por ello pudiendo ser objeto de reclamacion o queja por parte del cliente


5. COMPROBACI�N DE SU IDENTIDAD. REQUISITOS SOBRE BLANQUEO DE CAPITALES

5.1 Usted declara y garantiza que:

5.1.1 el nombre y la direcci�n que facilita a la hora de abrir su cuenta son correctos y est�n actualizados; y

5.1.2 que es el titular leg�timo del dinero que deposita en su cuenta.

5.2 Al aceptar los presentes T�rminos de Uso, nos autoriza a realizar cuantas comprobaciones sean necesarias seg�n nuestro propio criterio o de conformidad con los procedimientos dictados por las Autoridades espa�olas competentes en materia de juegos, o por cualquier otra autoridad, con el objetivo de verificar estos hechos (las Comprobaciones). Adem�s, acepta el hecho de que en cualquier momento podamos exigirle presentar datos/documentaci�n adicional relativa a la informaci�n que nos haya facilitado o a los dep�sitos que haya realizado en su cuenta.

5.3 Durante el tiempo que duren las comprobaciones, podemos restringir la utilizaci�n de fondos de su cuenta y/o prohibirle el acceso a toda la P�gina Web o a determinadas partes de la misma. Tenga en cuenta que podemos proceder a nuevas comprobaciones por razones comerciales, de seguridad o por imposici�n legal. En el caso de que estas restricciones le causasen alg�n inconveniente le rogamos que se ponga en contacto con nuestro servicio de atenci�n al cliente.

5.4 Puede que en determinadas circunstancias tengamos que ponernos en contacto con usted para pedirle que nos facilite m�s informaci�n directamente con el objetivo de finalizar las Comprobaciones correspondientes. A estos efectos podremos, seg�n estimemos oportuno, exigirle que nos facilite una certificaci�n notarial de identidad o equivalente, de conformidad con la legislaci�n aplicable en su jurisdicci�n, o prueba de direcci�n, facturas de suministros/servicios de consumo, datos bancarios, extractos bancarios y referencias bancarias. Hasta que no nos haya facilitado dicha informaci�n de manera satisfactoria podemos prohibir cualquier actividad en su cuenta o, en el caso de que creamos que nos ha facilitado informaci�n incorrecta de manera deliberada, podremos retener todo importe que haya depositado en la cuenta tras el cierre de la misma por nuestra parte y disponer de �l de conformidad con la normativa aplicable.

5.5 La utilizaci�n de la P�gina Web por parte de personas que no hayan cumplido la edad m�nima legal obligatoria puede constituir un delito. En el caso de que no podamos constatar que haya cumplido la edad m�nima obligatoria podremos suspender su cuenta hasta haber realizado las comprobaciones oportunas para poder confirmarlo. En el caso de que se pruebe que no hab�a cumplido la edad m�nima obligatoria en el momento de jugar o realizar transacciones de juego con nosotros:

5.5.1 se proceder� al cierre de su cuenta;

5.5.2 todas las transacciones que haya realizado siendo menor de edad se considerar�n nulas, y todos los fondos relacionados que haya depositado se devolver�n utilizando el m�todo de pago que se hubiese utilizado para el dep�sito de los mismos, siempre que sea posible;

5.5.3 se le devolver�n todos los dep�sitos que haya realizado antes de haber cumplido la edad m�nima legal obligatoria, y

5.5.4 perder� el derecho a todas las ganancias que haya podido acumular durante el periodo en el que no hab�a cumplido la edad m�nima legal obligatoria (pudiendo deducirlas del importe de los dep�sitos a devolver conforme al p�rrafo 5.5.3.) y, a petici�n nuestra, tendr� que devolvernos todos los fondos que haya retirado de su Cuenta. Las ganancias requisadas podr�n ser donadas a organizaciones ben�ficas o destinadas a cualquier otro uso seg�n lo estipulado en la normativa aplicable.


6. NOMBRE DE USUARIO, CONTRASE�A, PIN y INFORMACI�N SOBRE EL CLIENTE

6.1 Una vez haya abierto su cuenta, deber� tomar todas las medidas necesarias para evitar divulgar informaci�n a terceros (de manera deliberada o accidental) sobre su nombre de usuario, contrase�a y/o n�mero de cuenta. A tal efecto, tendr� que descargar programas de seguridad actualizados en su ordenador.

6.2 Todas aquellas transacciones para cuya realizaci�n se haya introducido correctamente su nombre de usuario, contrase�a y/o n�mero de cuenta se considerar�n v�lidas, est�n o no autorizadas por usted. Nosotros no asumiremos responsabilidad alguna por el uso de su cuenta en caso de que haya divulgado su nombre de usuario, contrase�a o n�mero de cuenta a terceros.

6.3 En el caso de que haya perdido u olvidado los datos de su cuenta, o si tiene motivos para creer que alg�n tercero no autorizado los conoce, le rogamos que se ponga en contacto con nosotros inmediatamente para cambiar los datos correspondientes a trav�s de nuestro departamento de atenci�n al cliente, cuyos datos de contacto puede encontrar en la secci�n de Ayuda de nuestra P�gina Web.


7. DEP�SITOS Y RETIRADAS DE SU CUENTA

7.1 Para poder acceder a los Servicios deber� depositar fondos en su cuenta provenientes de una cuenta o fuente de la que usted sea titular. Luego podr� utilizar dichos fondos (con sujeci�n a lo estipulado en la cl�usula 5) para realizar apuestas o participar en juegos. Podr� encontrar m�s informaci�n sobre c�mo depositar, retirar y transferir fondos en la p�gina Dep�sitos de la secci�n de Ayuda de la P�gina Web. En caso de que utilice un medio de pago del que no sea el titular nos reservamos el derecho de invalidar cualquier dep�sito que se haya hecho en la cuenta (as� como de anular cualquier ganancia obtenida haciendo uso de dicho dep�sito), hasta haber finalizado con �xito las comprobaciones pertinentes.

7.2 Adem�s se compromete a no devolver ni revocar las transferencias, ni a cancelar de alg�n otro modo los dep�sitos realizados en su cuenta. De lo contrario se ver� obligado a rembolsarlos o compensarnos por los dep�sitos no abonados, incluidos los gastos en los que hayamos podido incurrir con motivo del procedimiento de cobro de su dep�sito. A estos efectos, y para evitar cualquier malentendido, no podr� utilizar su cuenta como una cuenta bancaria y, de detectar que se realizan dep�sitos y retiradas de su cuenta sin venir acompa�ados de una actividad de juegos o apuestas acorde, nos reservamos el derecho de deducir una comisi�n por administraci�n de hasta el $% (procedamos o no al cierre o suspensi�n de su cuenta).

7.3 Su cuenta no es una cuenta bancaria, por lo que no est� asegurada, garantizada, respaldada ni protegida de ninguna otra manera por un sistema de seguros bancarios o de dep�sitos ni por otro sistema de seguros de �ndole similar. El dinero depositado en su cuenta no devengar� intereses. El dinero que deposite con nosotros estar� en una cuenta bancaria normal o en una cuenta de garant�a bloqueada a nombre de Bet-me, quien guardar� dicho dinero bajo fideicomiso a su favor y al del resto de personas autorizadas.

7.4 En la medida en la que requiera la legislaci�n local aplicable o las autoridades fiscales competentes, usted ser� responsable de la notificaci�n de las p�rdidas y ganancias en las que haya incurrido al acceder a los servicios.

7.5 Con arreglo a la reglamentaci�n aplicable, podr� depositar un m�ximo de 600 euros diarios; 1500 euros semanales y 3000 euros mensuales. No obstante, podr� autolimitar los dep�sitos a cualquier importe inferior al l�mite indicado de conformidad con la Cl�usula 7.6. En el caso de que desee aumentar o eliminar los l�mites legales o los que se haya autoimpuesto, tendr� que cumplir con los t�rminos y condiciones estipulados en nuestra Pol�tica de Juego Responsable.

7.6 Para obtener informaci�n sobre c�mo fijar un l�mite de dep�sitos, p�ngase en contacto con nuestro departamento de atenci�n al cliente o (en el caso de que su cuenta sea para la P�gina Web) podr� fijar el l�mite a trav�s de la P�gina Web haciendo clic en Mi cuenta, y luego en Actualizar los datos de la cuenta. Toda reducci�n confirmada del l�mite de los dep�sitos surtir� efecto de manera inmediata.

7.7 Con sujeci�n a lo estipulado en la cl�usula 12 (Cierre de su cuenta, etc.), podr� solicitar la retirada de fondos de su cuenta en cualquier momento siempre que:

7.7.1 se haya confirmado la realizaci�n efectiva de todos los pagos realizados a su cuenta y no se hayan producido devoluciones, revocaciones ni cancelaciones de los mismos;

7.7.2 se hayan finalizado las confirmaciones pertinentes a las que hace referencia la cl�usula 5 con resultado satisfactorio; y

7.7.3 haya cumplido con todas las condiciones de retirada de fondos aplicables a su cuenta (por ejemplo, los T�rminos de los Bonos, si procede).

7.8 Con respecto a cualquier retirada de fondos que haya recibido nuestra aprobaci�n, siempre y cuando nos facilite informaci�n suficiente acerca de c�mo transferirle los fondos a su favor, le devolveremos los fondos pertinentes de conformidad con lo estipulado en el punto 7.7. (una vez deducidos los costes en los que se haya incurrido o cualquier otro importe que deba deducirse de su retirada con arreglo a la legislaci�n aplicable).

7.9 Procesaremos y abonaremos las retiradas de fondos utilizando el mismo m�todo de pago que usted haya utilizado para realizar los dep�sitos en su cuenta, siempre y cuando dicho m�todo permita realizar un rembolso.

7.10 Mantendremos los fondos depositados en la cuenta de garant�a bloqueada y/o de dep�sito a la que hace referencia el p�rrafo 7.3. en tanto que fideicomisarios y no en calidad de banqueros o deudores. Por consiguiente, sin perjuicio de lo estipulado en cualquier otra disposici�n de los presentes T�rminos de Uso, trataremos su dinero como fideicomisarios, sin que por ello se cree u origine ninguna obligaci�n de pago por parte de Bet-me (o cualquier otra empresa del grupo) como si se tratase de un deudor.

7.11 Comisi�n por Cuenta Inactiva. En el caso de que no utilice su cuenta para apostar o jugar, realizando un dep�sito, una retirada o una transferencia, o si permanece inactiva por cualquier otro motivo, durante un periodo m�nimo de 24 meses consecutivos, se considerar� una Cuenta Inactiva. Todas las cuentas Inactivas generar�n una comisi�n por cuenta Inactiva. Podr� encontrar informaci�n al respecto en la secci�n de Ayuda de la P�gina Web. Nosotros le comunicaremos cuando su cuenta pase a considerarse una cuenta Inactiva con una antelaci�n m�nima de 14 d�as antes de proceder al cargo de ninguna comisi�n por cuenta Inactiva.


8. USO LEGAL DE LA P�GINA WEB

8.1 Puede que el acceso o uso de la P�gina Web o de cualquiera de los Servicios ofrecidos a trav�s de la P�gina Web no sea legal para algunos o todos los residentes o personas de determinados pa�ses. La P�gina Web no deber� ser utilizada para apostar, jugar o para cualquier otro fin por aquellas personas de los pa�ses en los que dichas actividades se consideren ilegales, incluidos los Estados Unidos de Am�rica y los territorios del listado que figura en la secci�n de Ayuda de la P�gina Web. El hecho de que se pueda acceder a la P�gina Web desde los pa�ses mencionados o de que el contenido de la misma est� disponible en el idioma de esos pa�ses no se debe interpretar como una declaraci�n o garant�a relativa a la legalidad del acceso y uso de la P�gina Web y de la realizaci�n de dep�sitos o recibo de las ganancias en su cuenta. La disponibilidad de acceso a la P�gina Web no constituye una oferta, incitaci�n o invitaci�n por nuestra parte al uso de la misma ni a registrarse para apostar, jugar o participar en cualquiera de los servicios ofrecidos en aquellas jurisdicciones donde dichas actividades est�n prohibidas por ley.

8.2 Usted ser� responsable de comprobar cu�l es la legislaci�n aplicable en el lugar en el que se encuentre. Se compromete a asegurarse de actuar de manera legal en su jurisdicci�n cuando abra su cuenta y/o utilice la P�gina Web.

8.3 Si nos constase que usted es residente en un pa�s en el que el uso de la P�gina Web no sea legal podremos proceder inmediatamente a la cancelaci�n de su cuenta, en cuyo caso procederemos a la devoluci�n del saldo del que disponga en la cuenta en la fecha de cierre tan pronto como nos resulte posible.

8.4 Todas aquellas apuestas propuestas por los clientes que se declaren ilegales, incluidas pero no l�mitadas segun la normativa vigente ser�n eliminadas y puestas en conocimiento de la autoridad competente, la empresa se reserva el derecho de eliminar apuestas segun su propio criterio incurran o no en delito seg�n la legislacion vigente del territorio en el que incurra.


9. C�MO REALIZAR APUESTAS Y/O PARTICIPAR EN JUEGOS UTILIZANDO LOS SERVICIOS

Para apostar o acceder a alg�n servicio deber� seguir las instrucciones que figuran en la secci�n de Ayuda.

9.1 Es responsabilidad suya garantizar que el contenido de las apuestas propuestas por usted esten acordes con la legalidad cumpliento lo estipulado en el Articulo 8

9.2 Es responsabilidad suya garantizar que los datos de las apuestas o transacciones similares que realice utilizando los servicios (Transacciones) sean correctos en la siguiente manera:

9.3.1 cuando utilice la P�gina Web (ya sea directamente, a trav�s de una aplicaci�n o de forma similar), deber�n ser conformes a las Reglas de Apuestas o Reglas del Juego correspondientes, seg�n corresponda; y

9.4 Podr� acceder al historial de Transacciones haciendo clic en Mi Cuenta en la P�gina Web, o a trav�s del equipo de atenci�n al cliente (tambi�n podr� optar por recibir un extracto por escrito). Con arreglo a la reglamentaci�n aplicable, guardaremos el historial de todas las Transacciones que realice durante un periodo de al menos seis (6) a�os tras el cierre de su cuenta.

9.5 Nos reservamos el derecho de rechazar la totalidad o parte de cualquiera de las Transacciones que solicite en cualquier momento, seg�n juzguemos oportuno, o cuando haya incumplido los T�rminos de Uso. Ninguna Transacci�n se considerar� aceptada por nosotros hasta que haya recibido la confirmaci�n correspondiente (o hasta que la hayamos aceptado de otra manera) de conformidad con lo estipulado en la cl�usula 9.2. Si tiene alguna duda sobre si alguna Transacci�n se ha aceptado con �xito puede ponerse en contacto con nuestro departamento de atenci�n al cliente.

9.6 Una vez una Transacci�n haya recibido nuestra aceptaci�n, no podr� cancelarla salvo que acordemos lo contrario.

9.7 Podremos, seg�n estimemos oportuno (siempre y cuando no suponga una ventaja injusta para usted o para nosotros), optar por aceptar una apuesta aunque el evento en cuesti�n ya haya comenzado. Con respecto a los juegos de azar, en la pesta�a de Reglas podr� encontrar informaci�n sobre el momento a partir del cual ya no podremos aceptar m�s apuestas.

9.8 Podremos cancelar o modificar cualquier Transacci�n de conformidad con lo estipulado en las cl�usulas 5 (Comprobaci�n de su Identidad), 11 (Colusi�n, Trampas, Fraude y Actividad Criminal) o 18 (Errores u Omisiones).


10. APUESTAS O JUEGOS A DISTANCIA

10.1 Cuando acceda a los Servicios a trav�s de una forma electr�nica de comunicaci�n tendr� que tener en cuenta que:

10.1.1 Con relaci�n al uso que haga de la P�gina Web para realizar apuestas o participar en juegos:

10.1.1.1 Puede que est� utilizando una conexi�n o un equipo m�s lento que el que utilicen los dem�s, lo que puede afectar a su rendimiento en aquellos eventos ofrecidos a trav�s de la P�gina Web en los que el tiempo juegue un papel importante;

10.1.1.2 Puede encontrarse con errores o fallos del sistema o interrupciones del servicio que se tratar�n de conformidad con lo estipulado en la cl�usula 17 (fallos inform�ticos);

10.1.1.3 Las Reglas del Juego para cada evento o juego ofrecido a trav�s de la P�gina Web estar�n siempre a su disposici�n y tendr� que tomarlas en consideraci�n antes de utilizar los servicios que ofrecemos a trav�s de la P�gina Web; y

10.1.1.4 en aquellos juegos ofrecidos a trav�s de la P�gina Web que se beneficien de m�s jugadores o de una mayor liquidez podremos hacer uso de jugadores electr�nicos (conocidos como robots y cuyo nombre de usuario ser� bots) pre-programados para jugar y unirse al juego a modo de ayuda con respecto a la liquidez o al n�mero de jugadores, si bien no usaremos bots sin dejar claro tal uso a los jugadores. Podemos confirmar categ�ricamente que no utilizamos jugadores electr�nicos (conocidos como robots o bots) en nuestro software de P�ker y tomaremos las medidas oportunas junto con nuestros proveedores de software para evitar su uso por parte de los usuarios de nuestros servicios; y

10.1.1.5 En relaci�n con el uso de los Servicios, si est� realizando una apuesta en un evento en curso, puede que no se le pueda facilitar o que no pueda acceder a la informaci�n m�s actualizada con respecto a dicho evento. No podemos garantizar que no se produzcan retrasos en la transmisi�n de informaci�n relativa a eventos en curso.


11. COLUSI�N, TRAMPAS, FRAUDE Y ACTIVIDAD CRIMINAL

11.1 Las siguientes pr�cticas (o alguna de ellas) en relaci�n con los Servicios:

? abuso de bonos u otras promociones; y/o

? uso de influencias o factores externos injustos (conocidos com�nmente como trampas); y/o

* obtener una ventaja injusta (tal y como se define en el p�rrafo 11.5.3.); y/o

* abrir cuentas duplicadas;

* permitir que un tercero utilice su cuenta;

? desarrollar actividades delictivas o pr�cticas fraudulentas (seg�n se definen en el p�rrafo 11.5.)

(en lo sucesivo Pr�cticas prohibidas) no est�n permitidas y constituyen un incumplimiento sustancial de los presentes T�rminos de Uso. Nosotros tomaremos todas las medidas necesarias para prevenir y detectar este tipo de pr�cticas, as� como para identificar a los jugadores involucrados en las mismas. No obstante, no asumiremos responsabilidad alguna por los da�os o las p�rdidas en las que haya incurrido como resultado de las Pr�cticas Prohibidas, y todas las acciones que emprendamos a tal efecto se llevar�n a cabo seg�n juzguemos oportuno.

11.2 En el caso de que sospeche que alguien est� implicado en una Pr�ctica Prohibida, deber� comunic�rnoslo tan pronto como le sea posible a trav�s de un correo electr�nico o llamando a nuestro equipo de atenci�n al cliente.

11.3 Usted se compromete a no participar ni estar involucrado de ninguna forma con Pr�cticas Prohibidas en lo que respecta al acceso o uso de los servicios.

11.4 En el caso de que:

11.4.1 tengamos motivos suficientes para creer que ha participado o ha estado relacionado de alg�n modo con una pr�ctica prohibida (para llegar a tal conclusi�n podemos utilizar -tanto nosotros, como nuestros socios de juego y proveedores- cualquiera de las pr�cticas disponibles de detecci�n de actos de colusi�n, trampas y fraude que se utilicen en el sector de juegos en su momento); o

11.4.2 haya hecho apuestas y/o haya participado en l�nea en juegos con otro proveedor en l�nea de servicios de juegos y se sospeche (como resultado de dicho juego) que se est� dando una pr�ctica prohibida o cualquier tipo de actividad indebida; o

11.4.3 nos conste que haya devuelto o rechazado alguna de las compras o dep�sitos realizados en su cuenta; o

11.4.4 est� incurso en un procedimiento de bancarrota o similar en alguna parte del mundo,

tendremos la facultad (adem�s de poder suspender y/o cancelar su cuenta), con respecto a su cuenta (y/o a cualquier otra cuenta que tenga con una empresa del grupo Bet-me), de retener la totalidad o parte del saldo y/o recuperar de la cuenta el importe de los dep�sitos, desembolsos, bonos o ganancias que est�n relacionados de alguna manera con los eventos descritos en el presente p�rrafo 11.4. o que se deriven de ellos. Todo ello sin perjuicio de cualquier otro derecho (incluidos aqu�llos conferidos por el derecho com�n) que podamos ejercer contra usted, ya sea con arreglo a lo estipulado en los presentes T�rminos de Uso o de cualquier otro modo.

11.5 A los efectos de la presente cl�usula 11:

11.5.1 por actividad fraudulenta se entiende cualquier tipo de actividad fraudulenta en la que est� implicado tanto usted como cualquier otra persona que act�e en su nombre o en connivencia con usted, entre otras: (a) rakebacks y devoluciones fraudulentas; (b) el uso como fuente de fondos, por su parte o por parte de otra persona que estuviera participando en el mismo juego al mismo tiempo, de tarjetas de cr�dito o debido robadas, duplicadas o no autorizadas por cualquier otro motivo; (c) la connivencia con terceros para obtener una ventaja injusta (ya sea a trav�s de reg�menes de bonos o de incentivos similares que ofrezcamos); (d) cualquier acci�n o acto que haya emprendido o intentado emprender y que nosotros tengamos motivos suficientes para considerar ilegal en la jurisdicci�n aplicable, realizado de mala fe o con el objetivo de estafarnos y/o sortear cualquier tipo de restricciones legales o contractuales, independientemente de que dicha acci�n u acto haya causado da�os o no;

11.5.2 entre las actividades delictivas se incluyen el blanqueo de capitales y cualquier delito conforme a la legislaci�n aplicable; y

11.5.3 el t�rmino ventajas injustas abarca, entre otras, la explotaci�n de un error, laguna jur�dica o fallo existente en nuestro software o el de terceros que usted utilice en relaci�n con los servicios (con respecto a cualquier juego), el uso de jugadores automatizados (bots), o la explotaci�n por su parte y en perjuicio nuestro o de otros jugadores de un Error seg�n la definici�n que se le confiere en el p�rrafo 18.1.

11.5.4 Actitudes que promuevan en sus comentarios o apuestas propuestas delitos tipificados que incluyen pero no se limitan a xenofobia, violencia de g�nero o exaltacion del terrorismo, asi como delitos de amenazas, injurias o contra el honor.

11.6 A la hora de ejercer nuestros derechos de conformidad con lo estipulado en el punto 11.4. en relaci�n con alguna pr�ctica prohibida, tomaremos cuantas medidas sean necesarias para garantizar el ejercicio de dichos derechos en una manera justa tanto para usted como para el resto de nuestros clientes, sin dejar de cumplir en ning�n momento con nuestras obligaciones reguladoras y legales.

11.7 Facilitaremos sus datos personales a las autoridades espa�olas competentes en material de juegos en el caso de que creamos que est� involucrado en alg�n tipo de pr�ctica prohibida. Asimismo, nos reservamos el derecho de informar a cualquier otra autoridad competente, operadores de juegos en l�nea, otros proveedores de servicios en l�nea y bancos, empresas de tarjetas de cr�dito, proveedores de pagos electr�nicos u otras entidades financieras acerca de su identidad y de la sospecha de su participaci�n en alguna pr�ctica prohibida, en su caso, y usted se compromete a cooperar totalmente con nosotros en el transcurso de la investigaci�n de dicha actividad.


12. CIERRE DE SU CUENTA; RESCISI�N DE LOS T�RMINOS DE USO

CIERRE Y RESCISI�N POR DECISI�N SUYA

12.1 Siempre y cuando en su cuenta no exista ning�n saldo a nuestro favor, podr� en todo momento optar por cerrarla y rescindir los presentes T�rminos de Uso mediante notificaci�n a tal efecto con una antelaci�n m�nima de 24 horas a trav�s de nuestro equipo de atenci�n al cliente, cuyos datos figuran en la secci�n de Ayuda de la P�gina Web:

12.1.1 indicando que desea cerrar su cuenta; y

12.1.2 se�alando las razones por las que desea cerrar su cuenta, especialmente si lo hace porque le preocupe el nivel del uso que le d�.

Recibir� una respuesta por nuestra parte a su solicitud, confirmando el cierre de su cuenta y la fecha efectiva de cierre, en un plazo m�ximo de 24 horas desde la recepci�n de la comunicaci�n de que su cuenta quedar�a inactiva.

12.2 Una vez solicite el cierre de su cuenta con arreglo a lo estipulado en el punto 12.1. procederemos, con sujeci�n a lo estipulado en el punto 12.3., a la devoluci�n de los saldos pendientes a su cuenta.

12.3 Una vez cerrada su cuenta con arreglo a lo estipulado en la presente cl�usula 12 podremos (sin limitar nuestros derechos conforme a lo estipulado en el p�rrafo 12.6.) retener, del rembolso del balance pendiente a su cuenta, cualquier importe conforme a lo estipulado en (a) el punto 11 (Colusi�n, Trampas, Fraude y Actividad Delictiva), (b) el punto 20 (Incumplimiento de los T�rminos de Uso), (c) los presentes T�rminos de Uso (incluido, en su caso, el p�rrafo 5.4.), o (d) la legislaci�n o reglamentaci�n aplicable.

12.4 Para proceder al rembolso del saldo pendiente en su cuenta utilizaremos el mismo m�todo de pago que usted haya facilitado al registrarse, o cualquier otro medio que usted elija, en su caso.

12.5 Aunque haya cerrado su cuenta, podremos en determinadas circunstancias reabrirla con los mismos datos si as� nos lo solicita. En este caso, a pesar de que la cuenta se abra con los mismos datos que ten�amos para la antigua, estar� sujeta a los T�rminos de Uso vigentes en la fecha de reapertura y los derechos anteriores (incluidos, entre otros, los bonos o ganancias contingentes) ya no ser�n v�lidos. Se le pedir� que acepte expresamente la versi�n aplicable de los T�rminos de Uso.

CIERRE Y RESCISI�N POR NUESTRA PARTE

12.6 Nosotros podremos en cualquier momento (sin perjuicio de lo estipulado en otras disposiciones de los presentes T�rminos de Uso) cerrar su cuenta y rescindir los presentes T�rminos de Uso mediante comunicaci�n por escrito (o intento de comunicaci�n) a sus datos de contacto. En este caso, con sujeci�n a lo estipulado en el punto 12.6., procederemos a rembolsar el saldo de su cuenta tan pronto como nos sea posible desde su petici�n a tal efecto.

12.7 En el caso de que procedamos a cerrar su cuenta y rescindir los presentes T�rminos de Uso con arreglo a lo estipulado en la cl�usula 11 (Colusi�n, Trampas, Fraude y Actividad Delictiva) o en la cl�usula 20 (Incumplimiento de los T�rminos de Uso), no tendr� derecho al rembolso del saldo de su cuenta y ser� confiscado en concepto de penalizaci�n por cualquier reclamaci�n que tengamos contra usted a la fecha de cierre (ya sea con respecto a su cuenta, a alguna cuenta duplicada o similares). El cierre de su cuenta y la rescisi�n de los presentes T�rminos de Uso por motivos diferentes a los expuestos en los puntos 11 o 20 de los presentes T�rminos Generales no afectar� a las apuestas pendientes, siempre y cuando se trate de apuestas v�lidas que no infrinjan los T�rminos de Uso en modo alguno. Para evitar cualquier duda, no abonaremos ning�n bono en su cuenta ni tendr� derecho a ninguna ganancia contingente tras la fecha de cierre de la cuenta (ya sea por nuestra parte, de conformidad con los presentes T�rminos de Uso, o como respuesta a una petici�n suya a tal efecto).

12.8 Las cl�usulas n�meros 19, 20, 21, 22, 23, 25 y 34, as� como cualquier otra que sea necesaria a los efectos de interpretaci�n de los presentes T�rminos de Uso, permanecer�n vigentes incluso despu�s de su rescisi�n; junto con cualquier otra secci�n relevante de las Reglas de Apuestas y la Pol�tica de Privacidad.

SUSPENSI�N POR NUESTRA PARTE

12.9 Podremos suspender su cuenta en el caso de que se produzcan las circunstancias expresamente indicadas a tal efecto en los T�rminos de Uso y/o la reglamentaci�n aplicable. Tras la suspensi�n de su cuenta: (a) no se permitir� ning�n tipo de actividad (incluidos dep�sitos, retiradas, apuestas o juegos) hasta la fecha en la que la reactivemos, (b) no se abonar�n bonos ni ganancias contingentes, y (c) trataremos el motivo que haya provocado la suspensi�n de la cuenta con el objetivo de resolverlo lo antes posible para poder proceder a la reactivaci�n o cierre de la cuenta, seg�n proceda.


13. ACCESO A LOS SERVICIOS Y USO DE LOS MISMOS

13.1 Ser� responsabilidad suya disponer de y mantener todos los equipos inform�ticos y redes de telecomunicaci�n y servicios de acceso a internet que necesite para acceder a los Servicios. Nosotros no seremos responsables en modo alguno por las p�rdidas que le haya podido causar el proveedor de servicios de internet o de telecomunicaciones que usted haya contratado para acceder a los Servicios (derivadas de la p�rdida del servicio, de una conexi�n deficiente a internet, de un ancho de banda insuficiente o por cualquier otro motivo). A estos efectos, Bet-me no ofrece garant�a alguna con respecto a la compatibilidad de los servicios con ning�n software o equipo inform�tico en concreto.

13.2 Bajo ninguna circunstancia podr� utilizar los servicios con fines que se puedan considerar difamatorios, abusivos, obscenos, il�citos o de naturaleza racista, sexista o discriminatoria, o que podr�an ser motivo de ofensa. Queda prohibido el uso de im�genes o de vocabulario abusivo o agresivo, as� como insultar, amenazar, acosar o injuriar a terceros, incluidos otros usuarios, a trav�s de la P�gina Web, o intentar hacerse pasar por otra persona, o mostrar comportamientos similares con el personal de Bet-me que ofrece los servicios, el equipo de atenci�n al cliente o cualquier persona que desempe�e funciones de ayuda o asistencia t�cnica.

13.3 Solamente podr� utilizar la P�gina Web para entretenimiento personal y no podr� facilitar el acceso a la misma ni reproducirla, en su totalidad o en parte, en ninguna forma, sin haber obtenido consentimiento previo a tal efecto, incluida la creaci�n de enlaces a la misma.

13.4 Usted ser� el �nico responsable con respecto a cualquier contenido que cargue en la P�gina Web (Contenido Cargado) y siempre que cargue o suba contenido declara y garantiza:

13.4.1 haber obtenido previamente todas las aprobaciones, consentimientos, licencias y permios que se requieran con respecto al contenido cargado y que la reproducci�n del mismo en la P�gina Web no infringe los derechos de autor, de marca registrada, de informaci�n confidencial o cualquier otro derecho de propiedad intelectual de terceros;

13.4.2 que el contenido cargado no contiene ning�n material que incumpla lo estipulado en la cl�usula 13.2. o cualquier c�digo que incumpla lo estipulado en la cl�usula 13.3;

13.4.3 que el contenido cargado cumple con todas las normativas y legislaci�n aplicables (incluidas, en especial, aqu�llas relativas a la privacidad y protecci�n de datos); y

13.4.4 que Bet-me est� facultado a usar y sub-licenciar el uso del contenido cargado seg�n estime oportuno.

13.5 Toda descarga de material desde la P�gina Web (salvo el Software mencionado en la cl�usula 16) la realizar� a su cuenta y riesgo. Bet-me no se responsabilizar� por las p�rdidas de datos u otros da�os causados con motivo de la descarga.

13.6 En el caso de que tengamos motivos para creer que el uso que haga de los servicios infringe lo estipulado en los puntos 13.2 podremos, sin perjuicio de cualquier otro derecho que podamos ejercer, retirar inmediatamente de la P�gina Web cualquier contenido ofensivo.


14. T�RMINOS APLICABLES A LAS APUESTAS Y A LOS JUEGOS

14.1 En el sector de los juegos de azar existen numerosas expresiones relacionadas con las apuestas y los juegos. Siempre que sea necesario, tendr� a su disposici�n un glosario en donde se explique el significado de las expresiones de apuestas y juegos empleadas habitualmente a trav�s de las secciones de Ayuda de la P�gina Web. En el caso de que tenga alguna duda con respecto al significado de alguna expresi�n, podr�:

14.1.1 buscar su significado en el glosario de la secci�n de Ayuda correspondiente al evento o juego en el que est� participando (apuesta o juego);

14.1.2 si a�n as� alberga dudas, p�ngase en contacto con el equipo de atenci�n al cliente para que le realice las aclaraciones oportunas; y

14.1.3 no apueste ni juegue hasta haber comprendido totalmente su significado,

porque no deber�a aceptar ning�n tipo de responsabilidad al apostar o jugar utilizando los productos ofrecidos a trav�s de los servicios si no entiende alguno de los t�rminos relacionados con la apuesta o juego en cuesti�n.


15. MODIFICACI�N DE LA P�GINA WEB

Podremos, a nuestro exclusivo criterio, modificar o cambiar cualquiera de los productos o servicios (incluidos los precios de los mismos) disponibles a trav�s de la P�gina Web en cualquier momento con el objetivo de garantizar la continuidad de la misma, sin que ello afecte a los juegos y/o apuestas ya en curso en el momento de dicha modificaci�n. En determinadas ocasiones podremos restringir el acceso a partes de la P�gina Web para poder realizar el mantenimiento de la misma y/o modificar los juegos y/o productos disponibles.


16. SOFTWARE DE TERCEROS

16.1 Puede que sea necesario suministrarle software (Software) de terceros para que pueda utilizar los productos ofrecidos a trav�s de los servicios.

16.2 En estos casos, puede que tenga que firmar otro contrato con el propietario del software correspondiente relativo a su uso (un Contrato de Software de Terceros). En caso de contradicci�n entre las disposiciones de los T�rminos de Uso y las del Contrato de Software de Terceros, prevalecer�n los T�rminos de Uso siempre y cuando la contradicci�n en cuesti�n sea relativa a la relaci�n existente entre usted y Bet-me.

16.3 Ser� responsabilidad suya asegurarse de que cualquier Software que se descargue en su ordenador se descargue de manera compatible con la configuraci�n espec�fica del mismo. Para evitar cualquier malentendido, nosotros quedamos exentos de cualquier responsabilidad por los efectos adversos que una descarga incorrecta de Software pueda ocasionar en el funcionamiento de su ordenador.

16.4 Todos los Servicios que se le ofrezcan a trav�s de smartphones o aplicaciones para dispositivos m�viles (Apps) estar�n sujetos a los presentes T�rminos de Uso. Las condiciones en las que se descarga o instala una determinada aplicaci�n en su smartphone o dispositivo m�vil quedar�n reguladas por el contrato correspondiente que haya firmado con el proveedor de la aplicaci�n pero, en caso de discrepancia entre los T�rminos de Uso y dicho contrato, prevalecer�n los T�rminos de Uso siempre y cuando la discrepancia en cuesti�n sea relativa a la relaci�n existente entre usted y Bet-me.


17. FALLOS INFORM�TICOS

17.1 Siempre que se produzcan problemas en el software o equipo inform�tico que utilizamos para suministrar los Servicios tomaremos cuantas medidas sean necesarias para solucionar el problema lo antes posible. Cuando dichos problemas causen la interrupci�n de un juego en circunstancias en las que no se pueda reiniciar desde el mismo punto sin perjudicarle a usted o a otros jugadores, tomaremos las medidas oportunas para tratarle de manera justa (podremos incluso optar por restituir el saldo en su cuenta a la situaci�n en la que se encontraba tras finalizar la �ltima apuesta o juego registrado en el servidor de Bet-me justo antes de que surgiera el problema). Bet-me no garantiza el funcionamiento y la disponibilidad constantes de todos los productos ofrecidos. Bet-me posee un plan de contingencias que se activar� siempre que la P�gina Web o la plataforma de software se encuentre inoperativa por el motivo que sea. No obstante, Bet-me no garantiza que el software o los servicios cumplan con los requisitos del cliente o del jugador, que no sufran interrupciones, que no contengan errores, que se corrijan los defectos, ni que el software o el servidor que los pone a disposici�n del jugador no contenga virus ni bugs. Asimismo, tampoco garantiza la total funcionalidad, exactitud y fiabilidad de los materiales ni los resultados ni la exactitud de cualquier informaci�n obtenida a trav�s de los servicios.

17.2 Quedamos exonerados de toda responsabilidad con respecto a los problemas que pueda ocasionar el equipo que tanto usted como otros jugadores utilicen para acceder a los Servicios, o a los fallos relacionados con su proveedor de servicios de internet.

17.3 Adem�s, nos reservamos el derecho de interrumpir temporalmente el Servicio, previo consentimiento a tal efecto por parte de las autoridades espa�olas en materia de juegos, sin necesidad de previo aviso, por necesidades organizativas o razones de mantenimiento del sistema, sin perjuicio de sus derechos. No obstante, se pondr�n en marcha los planes de contingencia oportunos siempre que los Servicios est�n inoperativos por el motivo que sea.


18. ERRORES U OMISIONES

18.1 Puede que se d� el caso de que aceptemos una apuesta o realicemos un pago por error. A continuaci�n se ofrece una lista no exhaustiva de los casos que se pueden dar:

18.1.1 cuando se confunden o tergiversan las cuotas o los t�rminos de una apuesta o juego como resultado de un error o de una omisi�n evidente en la informaci�n o configuraci�n de un mercado, o como resultado de un malfuncionamiento inform�tico;

18.1.2 cuando hayamos cometido un error palpable. Se produce un error palpable cuando:

18.1.2.1 en relaci�n con las apuestas realizadas antes de producirse un evento, los precios/t�rminos ofrecidos son sustancialmente distintos a los disponibles en el mercado general; o

18.1.2.2 en relaci�n con un evento, los precios/t�rminos ofrecidos a el momento de realizar la apuesta son claramente incorrectos teniendo en cuenta la probabilidad de que se produzca el evento;

18.1.3 cuando hayamos continuado aceptando apuestas en un mercado en el que deber�an haber sido suspendidas, aunque el evento en cuesti�n est� ya en curso (salvo los casos en los que se acepten apuestas en curso) o ya haya finalizado (a veces se les conoce como apuestas tard�as);

18.1.4 cuando se haya producido un error como resultado de una pr�ctica prohibida con arreglo a lo estipulado en la cl�usula 11.1. (incluidos los casos en los que con motivo de dicha pr�ctica prohibida se hayan abonado fondos en su cuenta o usted haya retirado fondos de la misma);

18.1.5 cuando no deber�amos haber aceptado, o tenido el derecho de cancelar o volver a abonar una apuesta de conformidad con las Reglas del Apuestas (por ejemplo, debido a Contingencias Relacionadas);

18.1.6 cuando hayamos cometido un error con respecto al importe de las ganancias/rembolsos que abonamos a su favor, aunque sea como resultado de un error inform�tico o manual; o

18.1.7 cuando hayamos cometido un error con respecto al importe de apuestas libres y/o bonos que abonemos en su cuenta,

y todos estos casos se denominar�n Errores.

18.2 Nos reservamos el derecho a:

18.2.1 Cuando no se pueda razonablemente corregir o saldar la apuesta atendiendo al punto 18.2.1 superior, las apuestas se declarar�n nulas y la cantidad apostada se devolver�: o

18.2.2 enmendar cualquier Error que se haya cometido con respecto a una apuesta y volver a abonarla al precio correcto o en los t�rminos que estaban disponibles o deber�an haber estado disponibles a trav�s de Bet-me (salvo el error en cuesti�n) en el momento en el que se haya realizado la apuesta y se considerar� que la apuesta se realiz� conforme a los t�rminos habituales para la misma; o

18.2.3 en los casos en los que el error se produzca con motivo de una pr�ctica prohibida, tomar las medidas estipuladas en el punto 11.4.

18.3 Todo importe que le haya sido abonado en su cuenta o pagado de otro modo como resultado de un error se tratar�, hasta haber solucionado el problema conforme a lo estipulado en el punto 18.2, como una cantidad que usted mantiene en fideicomiso a nuestro favor y que nos ser� devuelta de manera inmediata tras un requerimiento por nuestra parte a tal efecto. De producirse alguno de estos casos, si dispone de fondos en su cuenta podemos recuperarlos con arreglo a lo estipulado en el punto 7.4. No obstante, nos comprometemos a tomar las medidas necesarias para detectar cualquier tipo de error y comunicarle su existencia tan pronto como nos sea posible.

18.4 Tanto nosotros (o nuestros empleados y agentes) como nuestros socios o proveedores quedamos exonerados de cualquier responsabilidad por p�rdidas, incluidas las p�rdidas de ganancias, que se deriven de un error que hayamos cometido nosotros o que haya cometido usted.

18.5 En caso de que le conste que se haya producido un error, deber� notific�rnoslo lo antes posible.

18.6 En el caso de que haya utilizado los fondos que se le hayan abonado en su cuenta o que se le hayan pagado como resultado de un error para realizar otras apuestas o para jugar, podremos cancelar las apuestas mencionadas y/o retener cuantas ganancias haya obtenido utilizando dichos fondos. En el caso de que ya hayamos procedido a abonar dichas apuestas o juegos, los importes as� abonados se tratar�n como una cantidad que usted mantiene en fideicomiso a nuestro favor y que nos ser� devuelta de manera inmediata tras un requerimiento por nuestra parte a tal efecto.

18.7 En el caso de que en su cuenta haya fondos provenientes de (a) apuestas y/o juegos en los que haya participado de forma adecuada y otros (b) de apuestas y/o juegos en los que haya participado utilizando los fondos derivados de un error, a los efectos de este contrato y con el objetivo de una recuperaci�n adecuada de los mismos, se considerar� que dichos fondos provienen en su totalidad de apuestas y/o juegos en los que haya participado utilizando dinero resultante de un error, en la medida en la que sea necesaria para recuperar el importe requerido para enmendar el error en cuesti�n conforme a lo estipulado en la presente cl�usula 18 y en el punto 11.4. El saldo restante en su cuenta, una vez hayamos recuperado el importe correspondiente, se tratar� como fondos provenientes de apuestas y/o juegos en los que haya participado de manera correcta con sus propios fondos.


19. RESPONSABILIDAD

19.1 El acceso a los servicios ser� voluntario y correr� por su cuenta y riesgo.

19.2 Nosotros suministraremos los servicios con la debida diligencia y de conformidad con el contenido de los T�rminos de Uso. No realizamos ninguna otra promesa ni garant�a con respecto a los servicios, ni a los productos o servicios que los integran, y excluimos por medio del presente (en la medida en la que el derecho aplicable lo permita) toda garant�a impl�cita relativa a los mismos (incluidas las garant�as impl�citas relativas a la calidad satisfactoria y/o idoneidad de los servicios). En especial, no garantizamos una disponibilidad continua de la P�gina Web ni que no contenga bugs, virus u otros errores.

19.3 Nada de lo estipulado en los T�rminos de Uso podr� excluir nuestra responsabilidad en caso de:

19.3.1 fraude (incluida cualquier tergiversaci�n fraudulenta); o

19.3.2 fallecimiento o da�os personales causados con motivo de negligencia por nuestra parte.


20. INCUMPLIMIENTO DE LOS T�RMINOS DE USO

20.1 Usted nos exonera de toda responsabilidad tanto a nosotros como a nuestros directivos, directores, empleados, agentes, contratistas y proveedores con respecto a las p�rdidas, costes, gastos, reclamaciones, demandas y da�os (incluidas las costas legales) que se puedan producir, de manera predecible o no, como resultado de:

20.1.1 el acceso a los Servicios y su uso por usted o alguien que utilice su nombre de usuario y contrase�a; y/o

20.1.2 un incumplimiento por su parte de alguno de los t�rminos o disposiciones aqu� incluidos.

20.2 En el caso de incumplimiento de los T�rminos de Uso por su parte, podremos, antes de suspender o cancelar su cuenta, notificarle (utilizando sus datos de contacto) que se encuentra en una situaci�n de incumplimiento, exigi�ndole que ponga remedio a tal efecto y avis�ndole de las acciones que pretendemos emprender en caso contrario. Dicha notificaci�n no se considerar� nunca una condici�n obligatoria previa a la suspensi�n o cancelaci�n de su cuenta.

20.3 Tenemos derecho a deshabilitar cualquier contrase�a o c�digo de identificaci�n de usuario, independientemente de que lo haya escogido usted o se lo hayamos designado nosotros, en cualquier momento, siempre que tengamos motivos para considerar que ha infringido alguna de las disposiciones de los presentes T�rminos de Uso.

20.4 Adem�s de cualquier otra v�a de remedio disponible, en el caso de incumplimiento por su parte de los presentes T�rminos de Uso, podremos congelar su cuenta (incluidos los fondos que posea en ella) hasta que haya remediado la situaci�n o, en caso de que ya se haya emprendido un procedimiento a tal efecto, hasta que �ste se haya resuelto de conformidad con las disposiciones contenidas en el presente documento.


21. DERECHOS DE PROPIEDAD INTELECTUAL

21.1 Todos los dise�os de la web, los textos, gr�ficos, m�sica, sonido, fotograf�as, v�deos, la selecci�n y disposici�n de los mismos, compilaciones de software, c�digos fuente subyacentes, software y cualquier otro material que contenga la p�gina y que forme parte de los servicios est�n protegidos por derechos de autor y otros derechos de propiedad, ya sean bajo nuestra titularidad o utilizados bajo licencia de terceros. Siempre que el material que contienen los servicios tenga que descargarse o imprimirse, ha de hacerse en un �nico dispositivo �nica y exclusivamente para su propio uso personal y nunca para fines comerciales.

21.2 El uso de los servicios no le har� part�cipe en ning�n caso de los derechos de propiedad intelectual (por ejemplo derechos de autor, know-how o marcas registradas) de los que nosotros u otros terceros somos propietarios. Lo �nico que se le concede es una licencia personal, no exclusiva y no sublicenciable para utilizar dichos derechos de propiedad intelectual en relaci�n con el uso personal y no comercial que haga de los servicios con arreglo a los presentes T�rminos de Uso.

21.3 No se concede ning�n tipo de derecho para utilizar o reproducir las marcas registradas o logos que aparecen en la P�gina Web, salvo que se permita espec�ficamente de conformidad con los T�rminos de Uso.

21.4 No podr� copiar, almacenar, publicar, alquilar, licenciar, vender, distribuir, modificar, complementar, eliminar, borrar ni manipular la totalidad o parte de la P�gina Web, ni interferir o modificar en modo alguno (o intentar interferir o modificar en modo alguno) su contenido, directa o indirectamente, ni permitir que terceros lo hagan, salvo en la medida necesaria para ver o utilizar la P�gina Web de conformidad con los presentes T�rminos de Uso.

21.5 Todos los derechos de propiedad intelectual a nombre de Bet-me y Paperbet, los logos, dise�os, marcas registradas y otros signos distintivos de la marca de Bet-me, as� como el contenido para la P�gina Web que suministra Bet-me o alg�n tercero, recaen en Bet-me o en el tercero correspondiente. Usted se compromete a no exponer ni utilizar dichos logos, dise�os, marcas registradas u otros signos distintivos de la marca en modo alguno sin haber obtenido nuestro consentimiento previo y por escrito a tal efecto.


22. VIRUS, PIRATER�A INFORM�TICA Y OTROS DELITOS

22.1 Queda prohibido:

22.1.1 corromper la P�gina Web;

22.1.2 intentar obtener acceso no autorizado a la P�gina Web, a los servidores en donde se almacena o a cualquier otro servidor, ordenador o base de datos asociados a la P�gina Web;

22.1.3 inundar la P�gina Web con informaci�n, entradas m�ltiples o spam;

22.1.4 utilizar deliberadamente o con negligencia cualquier funci�n que afecte de alg�n modo al funcionamiento de la P�gina Web, por ejemplo, liberando o propagando virus, gusanos, troyanos, bombas l�gicas o material similar de naturaleza malintencionada y da�ina;

22.1.5 interferir con, modificar, eliminar o cambiar de alg�n modo la informaci�n contenida en la P�gina Web;

22.1.6 atacar la P�gina Web a trav�s de un ataque de rechazo de servicio o un ataque de rechazo de servicio distribuido. Notificaremos cualquier sospecha de incumplimiento de la Ley sobre Delitos Inform�ticos de 1990 a las autoridades competentes y colaboraremos con ellas facilit�ndoles su identidad. De producirse un incumplimiento de estas caracter�sticas, su derecho a utilizar la P�gina Web quedar� inmediatamente revocado.

22.2 No garantizamos que la p�gina no vaya a sufrir ataques de rechazo de servicio distribuidos, o que no contenga virus u otro material tecnol�gicamente da�ino que pueda infectar su equipo inform�tico, programas inform�ticos, datos u otro material con motivo de uso que haga de la P�gina Web o al descargar el material en ella contenido, o en otra P�gina Web vinculada a la nuestra.


23. SU INFORMACI�N PERSONAL

23.1 Toda la informaci�n que tengamos sobre usted en su cuenta la tratamos y almacenamos de manera segura y confidencial, salvo que se indique lo contrario en los T�rminos de Uso (incluida la Pol�tica de Privacidad).

23.2 La Ley nos exige, que cumplamos los requisitos de protecci�n de datos en la forma en que recopilemos su informaci�n personal en su uso de la Web y el servicio de Apuestas Telef�nicas. Por lo tanto, nos tomamos muy en serio nuestras obligaciones en relaci�n con la manera en la que usamos su informaci�n personal

23.3 Cuando utilice los servicios tendremos que recopilar determinada informaci�n sobre usted, incluido su nombre, fecha de nacimiento, datos de contacto, y, en algunos casos, informaci�n sobre sus preferencias comerciales (en lo sucesivo denominada colectivamente su Informaci�n Personal).

23.4 Al facilitarnos su informaci�n personal, acepta que la tratemos, incluida aquella de naturaleza especialmente sensible,

23.4.1 con los fines estipulados en los T�rminos de Uso (incluida la Pol�tica de Privacidad); y

23.4.2 con cualquier otro fin cuando tengamos que tratar su informaci�n personal para ofrecer los Servicios,

Adem�s, podremos compartirla con nuestros proveedores de servicio y agentes con los fines indicados, por ejemplo con nuestros suministradores de servicios postales, de marketing y nuestros agentes de atenci�n al cliente. Tambi�n podremos vernos obligados a divulgar su Informaci�n Personal para cumplir con alguna obligaci�n regulatoria o legal.

23.5 Guardaremos copia de todas las comunicaciones que nos env�e (incluidos los correos electr�nicos) para poder mantener archivos exactos y precisos de la informaci�n que hayamos recibido de usted. Adem�s, tambi�n guardaremos una versi�n de los T�rminos de Uso que haya aceptado durante un periodo de seis (6) a�os despu�s de que haya cancelado su Cuenta. Durante dicho periodo de tiempo, su informaci�n personal permanecer� bloqueada, y una vez transcurridos los seis a�os, ser� eliminada.


24. USO DE COOKIES EN LA P�GINA WEB

24.1 En la P�gina Web se utilizan cookies para rastrear del uso que haga de la web y para ayudar a la funcionalidad de la misma. Un cookie es un archivo de texto de peque�o tama�o que se descarga en su ordenador cuando accede a la P�gina Web y permite reconocerle cuando vuelve a acceder. Utilizamos cookies para el funcionamiento de la P�gina Web, por ejemplo, para permitir que siga registrado mientras navega por diferentes partes de la P�gina Web y utiliza su cuenta para apostar o jugar en las mismas. Tambi�n utilizamos cookies para nuestros propios fines anal�ticos para identificar cu�ndo se han encontrado problemas t�cnicos nuestros clientes, con el objetivo de ayudarnos a mejorar la experiencia del cliente.

24.2 En el caso de que desee oponerse al uso de cookies o quiera eliminar aquellos cookies que ya est�n almacenados en su ordenador, le recomendamos que siga las instrucciones para la eliminaci�n de cookies existentes y para deshabilitar cookies futuros en su software de gesti�n de archivos. Para obtener m�s informaci�n sobre la eliminaci�n o el control de cookies consulte nuestra Pol�tica de Privacidad o visite www.aboutcookies.org. Le recordamos que si borra nuestros cookies o deshabilita los cookies futuros puede que no tenga acceso a determinadas zonas o funciones de la web.


25. RECLAMACIONES Y NOTIFICACIONES

25.1 Ninguna reclamaci�n o disputa con respecto a:

25.1.1 la aceptaci�n o abono de una apuesta que haya realizado utilizando los Servicios se tomar� en consideraci�n transcurridos 30 d�as desde la fecha de la transacci�n original; y

25.1.2 un juego en el que haya participado utilizando los Servicios se tomar� en consideraci�n transcurridas 12 (doce) semanas desde que el juego o la transacci�n correspondiente tuviera lugar.

25.2 En el caso de que desee realizar una queja relativa a los Servicios, en primer lugar tendr� que ponerse en contacto lo antes posible con nuestro equipo de atenci�n al cliente a tal efecto, quien derivar� la queja al superior jer�rquico correspondiente hasta su resoluci�n.

25.3 En el caso de que surja una disputa derivada de los presentes T�rminos de Uso que nuestro equipo de atenci�n al cliente, despu�s de derivarla a la persona adecuada conforme a lo estipulado en el punto 25.2., no pueda resolver, puede solicitar que un gerente o supervisor trate el tema. Haremos lo posible para resolver la cuesti�n pertinente de manera satisfactoria para usted de forma inmediata o poni�ndonos en contacto con usted lo antes posible.

25.4 Si no quedase satisfecho con la soluci�n que le proponemos, acepta someter la disputa a arbitraje con las autoridades espa�olas competentes en materia de juego, teniendo en cuenta que el laudo resultante se considerar� final y vinculante para ambas partes. Para obtener m�s informaci�n sobre los servicios de resoluci�n de conflictos de las autoridades espa�olas competentes, visite la p�gina de la Comisi�n Nacional del Juego .Nos reservamos el derecho de retener el pago de cualquier evento que sea objeto de investigaci�n con motivo de una actividad corrupta.

Grabaremos todas las transacciones telef�nicas y electr�nicas que hayamos realizado con usted en inter�s de ambas partes, y usted presta su consentimiento a tal efecto. Cuando surja una disputa que no pueda ser resuelta, facilitaremos las grabaciones correspondientes a las autoridades espa�olas en materia de juegos.

25.5 De manera adicional o alternativa,los conflictos se podr�n someter a arbitraje a trav�s del Servicio Independiente de Arbitraje de Apuestas (IBAS), cuyo n�mero de tel�fono es el +44 207 347 5883. Puede obtener m�s informaci�n sobre el IBAS en www.ibas-uk.com. El laudo dictado por el Ibas se considerar� final siempre que todas las partes implicadas presenten la totalidad de los hechos. Le podemos facilitar la direcci�n postal del IBAS si as� nos lo solicita.

25.6 Reconoce y acepta que nuestro generador de n�meros aleatorios determinar� el resultado de los juegos en los que participe a trav�s de los Servicios y se compromete a aceptar el resultado de dichos juegos. Tambi�n acepta que, en el caso improbable de que se produzca un desacuerdo entre el resultado que aparece en su pantalla y el servidor utilizado por Bet-me, prevalecer� el resultado que aparezca en el servidor de juegos, y que nuestros registros se tomar�n en consideraci�n para determinar los t�rminos y circunstancias de su participaci�n en la actividad de juego en l�nea correspondiente y los resultados de dicha participaci�n.

25.7 Cuando tengamos que ponernos en contacto con usted lo haremos utilizando sus datos de contacto. Se considerar� que las notificaciones han sido debidamente entregadas y recibidas por usted inmediatamente despu�s de haber enviado un correo electr�nico y obtenido confirmaci�n de entrega, o despu�s de habernos puesto en contacto con usted directamente por tel�fono (incluso en el caso de que le hayamos dejado un mensaje de voz), o de haberle realizado la notificaci�n por alg�n medio certificado. Para justificar la entrega de alguna notificaci�n, bastar� con probar, en el caso de una carta, que se ha enviado sellada y a la direcci�n correcta; y en el caso de un correo electr�nico, que se ha enviado a la direcci�n de correo que usted hubiese especificado (en su caso) en sus datos de contacto en el momento de env�o.


26. CESI�N DE DERECHOS Y OBLIGACIONES

26.1 Nos reservamos el derecho de transferir, asignar, entregar u otorgar sublicencias sobre la totalidad o parte de los T�rminos de Uso (asignaci�n) a terceros, siempre que dicha cesi�n o asignaci�n haya recibido la aprobaci�n de las autoridades espa�olas competentes en materia de juegos o el organismo que posea las competencias correspondientes en su momento. Usted no podr� asignar, otorgar sublicencias, transferir ni ceder en modo alguno los derechos u obligaciones contra�das conforme a los presentes T�rminos de Uso.


27. ACONTECIMIENTOS FUERA DE NUESTRO CONTROL

27.1 Quedamos exonerados de todo tipo de responsabilidad por no poder cumplir con las obligaciones contra�das en los presentes T�rminos de Uso, o por el retraso en el cumplimiento de las mismas, siempre que el motivo sean acontecimientos que se escapen a nuestro control, incluidos (entre otros) fallos en las redes de telecomunicaci�n, cortes de suministro, fallos en los equipos inform�ticos de terceros, incendios, tormentas, explosiones, inundaciones, condiciones climatol�gicas extremas, cierres o disputas industriales y actos gubernamentales o de otras autoridades competentes (en lo sucesivo, Causa de Fuerza Mayor).

27.2 El cumplimiento de nuestras obligaciones quedar� suspendido durante el periodo que dure la Causa de Fuerza Mayor, disponiendo posteriormente de una ampliaci�n equivalente en el tiempo para cumplir con nuestras obligaciones. Haremos lo que est� en nuestras manos para poner fin a la Causa de Fuerza Mayor lo antes posible y para encontrar una soluci�n para poder cumplir con nuestras obligaciones a pesar de que se haya producido una Causa de Fuerza Mayor.


28. CL�USULA DE RENUNCIA

28.1 En el caso de que no insistamos en el cumplimiento estricto de alguna de las obligaciones que usted haya adquirido o que no ejerzamos los derechos o v�as de remedio disponibles a tal efecto, esto no significa que renunciemos a los derechos o v�as de remedio que nos han sido conferidos y no le eximir� del cumplimiento de dichas obligaciones.

28.2 La renuncia por nuestra parte a tomar medidas ante un incumplimiento no constituir� una renuncia a tomar medidas por incumplimientos posteriores.

28.3 Ninguna renuncia por nuestra parte de las disposiciones de los T�rminos de Uso ser� efectiva salvo que se indique expresamente como tal y que se le notifique por escrito de conformidad con lo dispuesto en la cl�usula 25 (Quejas y Notificaciones).


29. DIVISIBILIDAD

29.1 En el caso de que alguna autoridad competente determine que alguno de los T�rminos de Uso sea inv�lido, ileg�timo o inaplicable en alg�n modo, dicho t�rmino, condici�n o disposici�n se separar� del resto de los t�rminos, condiciones y provisiones, que continuar�n siendo v�lidas en el m�s amplio sentido permitido por ley.

29.2 En estos casos, la parte considerada inv�lida o inaplicable se modificar� de manera coherente con la legislaci�n aplicable, reflejando, tan fielmente como sea posible, la intenci�n original de Bet-me.


30. INTEGRIDAD DEL CONTRATO

30.1 Los T�rminos de Uso, as� como cualquier otro documento al que hagan referencia expresamente, constituyen la totalidad del contrato entre usted y nosotros y sustituyen a cualquier otro contrato, acuerdo o pacto entre las partes, ya sea oral o escrito.

30.2 Ambas partes declaran no haber recibido garant�as, declaraciones o promesas de la otra, expresas o impl�citas como consecuencia de negociaciones orales o escritas, salvo las que se indican expresamente en los presentes T�rminos de Uso.

30.3 Ninguna de las partes tendr� derecho a tomar medidas con respecto a declaraciones inciertas realizadas por la otra, ya sean orales o escritas, con car�cter previo a la fecha de formalizaci�n del presente contrato (salvo que se hubiesen realizado de manera fraudulenta) y la �nica v�a de recurso de que dispondr�n las partes ser� por incumplimiento del contrato seg�n se estipula en los T�rminos de Uso.


31. DERECHO Y JURISDICCI�N APLICABLES

31.1 Los presentes T�rminos de Uso ser�n regidos e interpretados de conformidad con el derecho espa�ol.

31.2 Los juzgados y tribunales de Espa�a ser�n competentes para resolver sobre cualquier disputa derivada de los presentes T�rminos de Uso.

32. VIGENCIA DE LOS T�RMINOS DE USO

32.1 El presente contrato permanecer� indefinidamente en vigor hasta que alguna de las partes lo rescinda con arreglo a las disposiciones del mismo.


33. ENLACES

33.1 Los hiperv�nculos existentes a otras p�ginas web se indican �nicamente con fines informativos. El uso que de ellos haga correr� por su cuenta y riesgo y nosotros no aceptamos responsabilidad alguna por el contenido o uso de dichas p�ginas web, ni por la informaci�n en ellas contenida. No podr� crear enlaces a nuestra p�gina ni enmarcarla sin nuestro consentimiento expreso a tal efecto.


34. CONTACTO

Puede ponerse en contacto con Bet-me por correo postal enviado a las direcciones indicadas en la cl�usula 2.1.; por correo electr�nico a trav�s de la secci�n de Cont�ctenos; o por tel�fono."</textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="help" tabindex="-1" role="dialog" aria-labelledby="myModalhelp" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalhelp"><spring:message code="master.footer.help"/></h4>
      </div>
      <div class="modal-body">
        	<textarea name="text" rows="20" cols="80" readonly="readonly">
        	
        	Reglas de juegos
        	
        	</textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		var cookie = $.cookie("language");
		//alert(cookie);
		if(cookie == undefined){
			showLocation();
		}
	});
	
	function showLocation(){
		navigator.geolocation.getCurrentPosition(callback);
	}
	
	function callback(position){
		var latitude = position.coords.latitude;
		var longitude = position.coords.longitude;
		//alert(latitude+", "+longitude);
		var url = $(location).attr("href");
		// Est� en Espa�a
		if(latitude > 36 && latitude < 43.8){
			if(longitude > -9.3 && longitude < 4.33){
				//alert("Est�s en Espa�a");
				$.cookie("language", "es", {path: '/'});
				$(window).attr('location', url+"?language=es");
			}
			
		}else{
			// Est� en Canarias
			if(latitude > 27.61 && latitude < 29.32){
				if(longitude > -18.17 && longitude < -13.41){
					//alert("Est�s en Canarias");
					$.cookie("language", "es", {path: '/'});
					$(window).attr('location', url+"?language=es");
				}
			}else{
				//alert("Est�s fuera de Espa�a");
			}
		}
	}
</script>