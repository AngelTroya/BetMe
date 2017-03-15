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
				Català
			</a>
            </li>
            <li>
				<a class="terms" href="?language=es" rel="tooltip" title="<spring:message code="master.page.spanish" />" >
				Español
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
			TÉRMINOS Y CONDICIONES DE USO DE BET-ME (pendiente de revisión antes de salir al mercado)
			
			
1. INTRODUCCIÓN: DEFINICIONES CLAVE Y CONTENIDO DE LOS TÉRMINOS DE USO
1.1 En los presentes términos y condiciones se utilizan las siguientes definiciones:

Términos de los Bonos hace referencia a los términos y condiciones y/o las reglas aplicables a promociones, bonos y ofertas especiales que puedan ser de aplicación en su momento a cualquier parte de los Servicios

Sus Datos de Contacto serán los definidos en el párrafo 4.5.

Términos de Descarga hace referencia a los posibles términos y condiciones de uso para usuario final que tendrá que aceptar adicionalmente como parte del proceso de descarga y/o instalación de cualquier tipo de software que pudiera tener que descargar para utilizar la Página Web, incluido el Contrato de Licencia para Usuario Final de Paperbet, que podrá consultar en el Anexo de los presentes Términos y Condiciones Generales.

Términos Generales hace referencia a los términos y condiciones que se especifican en el presente documento.

Política de Privacidad hace referencia a la política de privacidad de Bet-me a la que se puede acceder a través del enlace Política de privacidad.

Reglas significa las Reglas de Apuestas y las Reglas del Juego aplicables específicamente al tipo de apuesta y/o juego correspondiente, según se definen con más detalle en los puntos 1.3.1. y 1.3.2.

Servicios hace referencia a los servicios prestados en su momento por Paperbet a través de la Página Web

Términos de Uso comprende (a) los Términos Generales, (b) la Política de Privacidad y (c), si procede de conformidad con la cláusula 1.3., las Reglas y Términos de Bonos aplicables a los Servicios que usted esté utilizando y (d) los Términos de Descarga.

Página Web hace referencia a la página www.betme.es o a cualquier página o parte de la misma que la sustituya en su momento

Bet-Me pertenece a Paperbet SA (pudiendo ser usados indistintamente según sea el caso de conformidad con lo estipulado en la cláusula 2 de los presentes Términos).

1.2 Al utilizar y/o visitar cualquier sección de la Página Web, o al abrir una cuenta con la empresa Paperbet correspondiente a través de la Página Web, usted acepta expresamente los Términos y Condiciones de Uso y, en consecuencia, (a) acepta utilizar el medio de comunicación electrónica para formalizar contratos, y (b) renuncia a cualquier derecho o requisito aplicable que implique tener que incluir su firma original de puño y letra, en la medida en la que la legislación aplicable lo permita. Los Términos de Uso no afectan a los derechos que le confiere la ley.

1.3 Además, cada vez que usted participe en un juego o realice una apuesta utilizando los Servicios, se compromete a respetar:

1.3.1 las Reglas para Apuestas Deportivas que figuran en el Libro de apuestas deportivas de Bet-me, al que se puede acceder a través de la pestaña de Ayuda (las Reglas de Apuestas);

1.3.2 Las Reglas aplicables a cada juego en concreto (Reglas del Juego), que figuran en la pestaña de Ayuda o de Reglas correspondiente;

1.3.3 los Términos de los Bonos; y

1.3.4 los Términos de Descarga.

1.4 El texto original de los Términos de Uso está redactado en español e inglés. No obstante, toda interpretación del mismo se hará de conformidad con la versión española, que prevalecerá en caso de controversia.

1.5 En el caso de que se produzca algún conflicto o contradicción entre las partes que integran los Términos de Uso que constituyen su contrato con Bet-me, el orden de prioridad será el siguiente:

1.5.1 Los Términos de los Bonos;

1.5.2 Las Reglas de Apuestas;

1.5.3 Las Reglas del Juego;

1.5.4 Los Términos Generales;

1.5.5 La Política de Privacidad; y

1.5.6 Los Términos de Descarga.

1.6 Le rogamos que lea atentamente los presentes Términos de Uso antes de aceptarlos. Una vez los haya aceptado expresamente, imprima una versión de los mismos y guárdelos junto con todos los correos electrónicos de confirmación, términos adicionales, datos de transacciones, reglas del juego, reglas de trato justo y los métodos de pago aplicables al uso que haga de la Página Web. Bet-me guardará todos los Términos de Uso que usted haya aceptado durante un periodo de seis años tras la cancelación de su cuenta. Durante el periodo expresado, sus datos personales permanecerán bloqueados, y una vez transcurrido dicho periodo de seis años, serán eliminados. En nuestra Política de Privacidad podrá obtener más información sobre la protección de datos. Cabe comentar que los Términos de Uso quedan sujetos a cambios, tal y como se estipula en la cláusula 3 siguiente.

1.7 En el caso de que no acepte los Términos de Uso no podrá abrir ninguna cuenta ni continuar utilizando su cuenta, en su caso.

1.8 Los Términos de Uso se aprobaron el 1 de Abril de 2014.


TÉRMINOS GENERALES
2. PARTES DE BET-ME

2.1 Los presentes Términos de Uso tendrán que ser aceptados tanto por usted como por la siguiente empresa del grupo Bet-me: Paperbet (en lo sucesivo Bet-me). Bet-me, %lt; Pendiente de inscripcion %gt; con número de sociedad N/D, con domicilio social en Avenida de Reina Mercedes S/N, es titular de seis licencias otorgadas por las Autoridades españolas competentes en materia de juegos.

 2.2 La Página Web, las cuotas y los precios que en ella se indican, junto con los Términos de Uso, están traducidos a varios idiomas, con el objetivo de que puedan ser utilizados por los ciudadanos que hablen esos idiomas.

2.3 Toda referencia contenida en los Términos de Uso a nosotros o nuestro/a/os/as se entenderá como referencias a Bet-me.

2.4 Una vez haya aceptado expresamente los presentes Términos de Uso y abierto una nueva cuenta, registrándose como usuario/cliente, podrá acceder y utilizar la Página Web y los Servicios con arreglo a los términos y condiciones contenidos en el presente contrato. Además, nos comprometemos a permitirle acceso a los servicios de juegos correspondientes conforme a las condiciones estipuladas en el presente contrato. En particular, cuando usted utilice la Página Web y los Servicios, en tanto que usuario/cliente, contará con los siguientes derechos:

a) Derecho a obtener información clara y correcta sobre las reglas aplicables a cualquiera de los juegos en los que participe como parte de los servicios ofrecidos a través de la Página Web, así como cualquier otra información relativa a los servicios correspondientes (importes apostados, saldos de las cuentas o el tiempo disponible de juego, tal y como se explica más adelante).

b) Derecho a obtener los premios que le puedan corresponder con arreglo a las reglas aplicables del juego en el que participe como parte de los servicios de juego, de conformidad con las condiciones estipuladas en el presente contrato y con las reglas aplicables al juego en cuestión.

c) Derecho a formalizar, ante Bet-me o la Comisión Nacional del Juego, cualquier queja o reclamación que estime necesaria con relación al uso que haga de los correspondientes servicios de juegos.


3. CAMBIOS EN LOS TÉRMINOS DE USO

3.1 Los presentes Términos de Uso pueden sufrir cambios por varias razones, entre otras, razones comerciales, con el objetivo de cumplir con la legislación aplicable, o con las instrucciones, pautas o recomendaciones dictadas por alguna entidad reguladora, o por motivos de atención al cliente.

3.2 En el caso de que se produzca algún cambio en los presentes Términos de Uso, se le notificará por los medios estipulados en el punto 3.3. y se requerirá su aceptación expresa de los mismos para que pueda acceder a los servicios de juegos que prestamos.

3.3 Se le notificará todo cambio en los presentes Términos de Uso a través de cualquier medio de notificación que consideremos oportuno, entre otros:

3.3.1 correo electrónico (a las direcciones de correo electrónico que nos haya facilitado previamente, en su caso);

3.3.2 envío de un mensaje a su Buzón de entrada en la Página Web; o

3.3.3 un aviso en la Página Web,

y le pediremos que acepte los nuevos Términos de Uso haciendo clic sobre sí o acepto, seleccionando la casilla correspondiente, o mediante cualquier otro medio de confirmación similar. En el caso de que no acepte expresamente los cambios realizados en los Términos de Uso, no podrá continuar utilizando los servicios de juegos que ofrecemos ni la Página Web.


4. APERTURA DE UNA CUENTA

4.1 Para realizar una puesta o participar en un juego utilizando los Servicios, es necesario abrir una cuenta con Bet-me (su Cuenta).

4.2 Para abrir una cuenta y utilizar los Servicios, puede optar por:

4.2.1 ponerse en contacto con el servicio de atención al cliente;

4.2.2 hacer clic en la sección Registrarse de la Página Web y seguir las instrucciones que aparecen en pantalla;

4.2.3 utilizar cualquier otro medio para apertura de cuentas que ponga a su disposición en su momento Bet-me.

4.3 Su cuenta será administrada por Bet-me.

4.4 Para abrir una cuenta le pediremos que nos facilite una serie de información personal, como su nombre, su fecha de nacimiento y los datos de contacto: dirección, número de teléfono y dirección de correo electrónico (sus Datos de Contacto). Podrá actualizar sus datos de contacto siempre que así lo desee poniéndose en contacto con nuestro equipo de atención al cliente o a través de la sección de gestión de Mi Cuenta de la Página Web, o a través de cualquier medio que en su momento ponga a su disposición Bet-me.

4.5 Si no desea que sus Datos de Contacto puedan ser utilizados por nosotros o por nuestros socios comerciales para ponerse en contacto con usted y hacerle llegar información con fines comerciales relativa a terceros o a nuestros productos y servicios o a aquéllos de nuestros socios, háganoslo saber seleccionando la casilla correspondiente, tal y como se le indicará al abrir una cuenta en la Página Web, o comunicándoselo al equipo de atención al cliente.

4.6 Al abrir su cuenta declara y garantiza:

4.6.1 que entiende y acepta el hecho de que, al usar nuestros servicios, podrá tanto ganar como perder dinero;

4.6.2 que (a) es mayor de edad y que (b) tiene la edad mínima legal obligatoria para poder participar en juegos de conformidad con la legislación aplicable en su jurisdicción (la Edad mínima legal);

4.6.3 que los juegos de azar no son ilegales en el territorio en el que reside;

4.6.4 que tiene capacidad legal suficiente para poder contraer contratos;

4.6.5 que no ha sido excluido previamente de este tipo de actividades de juegos ni tiene problemas de adicción al juego;

4.6.6 que no ha tenido ya una cuenta que hayamos procedido a cerrar en su momento con arreglo a lo estipulado en las cláusulas 11 (Colusión, Trampas, Fraude y Actividades Delictivas), 20 (Incumplimiento de los Términos de Uso) o por petición suya conforme a lo estipulado en la cláusula 32.1. (Juego Responsable).

4.7 Para registrarse tendrá que utilizar su propio nombre y facilitar datos personales y de contacto reales. Se trata de una cuenta personal que no podrá ser duplicada ni compartida por otra persona, familiar, persona con la que conviva, dirección (postal o de IP), ni por ningún entorno en donde se compartan ordenadores (por ejemplo: escuelas, lugar de trabajo, bibliotecas públicas, etc.), ordenador (o cualquier otro dispositivo similar de acceso), ni cuenta a los efectos de utilizar los Servicios. Usted es el titular único y exclusivo de su cuenta, cuyo uso no podrá ser transferido ni cedido a favor de terceros. De conformidad con la legislación vigente, solamente podrá ser titular de una cuenta activa.

4.8 Que por la naturaleza de nuestra página web, cualquier apuesta puede ser cancelada si se conviene según lo estipulado en las cláusulas 11 (Colusión, Trampas, Fraude y Actividades Delictivas), 20 (Incumplimiento de los Términos de Uso), siendo esto causa de restitucion por parte de Bet-me del dinero invertido no por ello pudiendo ser objeto de reclamacion o queja por parte del cliente


5. COMPROBACIÓN DE SU IDENTIDAD. REQUISITOS SOBRE BLANQUEO DE CAPITALES

5.1 Usted declara y garantiza que:

5.1.1 el nombre y la dirección que facilita a la hora de abrir su cuenta son correctos y están actualizados; y

5.1.2 que es el titular legítimo del dinero que deposita en su cuenta.

5.2 Al aceptar los presentes Términos de Uso, nos autoriza a realizar cuantas comprobaciones sean necesarias según nuestro propio criterio o de conformidad con los procedimientos dictados por las Autoridades españolas competentes en materia de juegos, o por cualquier otra autoridad, con el objetivo de verificar estos hechos (las Comprobaciones). Además, acepta el hecho de que en cualquier momento podamos exigirle presentar datos/documentación adicional relativa a la información que nos haya facilitado o a los depósitos que haya realizado en su cuenta.

5.3 Durante el tiempo que duren las comprobaciones, podemos restringir la utilización de fondos de su cuenta y/o prohibirle el acceso a toda la Página Web o a determinadas partes de la misma. Tenga en cuenta que podemos proceder a nuevas comprobaciones por razones comerciales, de seguridad o por imposición legal. En el caso de que estas restricciones le causasen algún inconveniente le rogamos que se ponga en contacto con nuestro servicio de atención al cliente.

5.4 Puede que en determinadas circunstancias tengamos que ponernos en contacto con usted para pedirle que nos facilite más información directamente con el objetivo de finalizar las Comprobaciones correspondientes. A estos efectos podremos, según estimemos oportuno, exigirle que nos facilite una certificación notarial de identidad o equivalente, de conformidad con la legislación aplicable en su jurisdicción, o prueba de dirección, facturas de suministros/servicios de consumo, datos bancarios, extractos bancarios y referencias bancarias. Hasta que no nos haya facilitado dicha información de manera satisfactoria podemos prohibir cualquier actividad en su cuenta o, en el caso de que creamos que nos ha facilitado información incorrecta de manera deliberada, podremos retener todo importe que haya depositado en la cuenta tras el cierre de la misma por nuestra parte y disponer de él de conformidad con la normativa aplicable.

5.5 La utilización de la Página Web por parte de personas que no hayan cumplido la edad mínima legal obligatoria puede constituir un delito. En el caso de que no podamos constatar que haya cumplido la edad mínima obligatoria podremos suspender su cuenta hasta haber realizado las comprobaciones oportunas para poder confirmarlo. En el caso de que se pruebe que no había cumplido la edad mínima obligatoria en el momento de jugar o realizar transacciones de juego con nosotros:

5.5.1 se procederá al cierre de su cuenta;

5.5.2 todas las transacciones que haya realizado siendo menor de edad se considerarán nulas, y todos los fondos relacionados que haya depositado se devolverán utilizando el método de pago que se hubiese utilizado para el depósito de los mismos, siempre que sea posible;

5.5.3 se le devolverán todos los depósitos que haya realizado antes de haber cumplido la edad mínima legal obligatoria, y

5.5.4 perderá el derecho a todas las ganancias que haya podido acumular durante el periodo en el que no había cumplido la edad mínima legal obligatoria (pudiendo deducirlas del importe de los depósitos a devolver conforme al párrafo 5.5.3.) y, a petición nuestra, tendrá que devolvernos todos los fondos que haya retirado de su Cuenta. Las ganancias requisadas podrán ser donadas a organizaciones benéficas o destinadas a cualquier otro uso según lo estipulado en la normativa aplicable.


6. NOMBRE DE USUARIO, CONTRASEÑA, PIN y INFORMACIÓN SOBRE EL CLIENTE

6.1 Una vez haya abierto su cuenta, deberá tomar todas las medidas necesarias para evitar divulgar información a terceros (de manera deliberada o accidental) sobre su nombre de usuario, contraseña y/o número de cuenta. A tal efecto, tendrá que descargar programas de seguridad actualizados en su ordenador.

6.2 Todas aquellas transacciones para cuya realización se haya introducido correctamente su nombre de usuario, contraseña y/o número de cuenta se considerarán válidas, estén o no autorizadas por usted. Nosotros no asumiremos responsabilidad alguna por el uso de su cuenta en caso de que haya divulgado su nombre de usuario, contraseña o número de cuenta a terceros.

6.3 En el caso de que haya perdido u olvidado los datos de su cuenta, o si tiene motivos para creer que algún tercero no autorizado los conoce, le rogamos que se ponga en contacto con nosotros inmediatamente para cambiar los datos correspondientes a través de nuestro departamento de atención al cliente, cuyos datos de contacto puede encontrar en la sección de Ayuda de nuestra Página Web.


7. DEPÓSITOS Y RETIRADAS DE SU CUENTA

7.1 Para poder acceder a los Servicios deberá depositar fondos en su cuenta provenientes de una cuenta o fuente de la que usted sea titular. Luego podrá utilizar dichos fondos (con sujeción a lo estipulado en la cláusula 5) para realizar apuestas o participar en juegos. Podrá encontrar más información sobre cómo depositar, retirar y transferir fondos en la página Depósitos de la sección de Ayuda de la Página Web. En caso de que utilice un medio de pago del que no sea el titular nos reservamos el derecho de invalidar cualquier depósito que se haya hecho en la cuenta (así como de anular cualquier ganancia obtenida haciendo uso de dicho depósito), hasta haber finalizado con éxito las comprobaciones pertinentes.

7.2 Además se compromete a no devolver ni revocar las transferencias, ni a cancelar de algún otro modo los depósitos realizados en su cuenta. De lo contrario se verá obligado a rembolsarlos o compensarnos por los depósitos no abonados, incluidos los gastos en los que hayamos podido incurrir con motivo del procedimiento de cobro de su depósito. A estos efectos, y para evitar cualquier malentendido, no podrá utilizar su cuenta como una cuenta bancaria y, de detectar que se realizan depósitos y retiradas de su cuenta sin venir acompañados de una actividad de juegos o apuestas acorde, nos reservamos el derecho de deducir una comisión por administración de hasta el $% (procedamos o no al cierre o suspensión de su cuenta).

7.3 Su cuenta no es una cuenta bancaria, por lo que no está asegurada, garantizada, respaldada ni protegida de ninguna otra manera por un sistema de seguros bancarios o de depósitos ni por otro sistema de seguros de índole similar. El dinero depositado en su cuenta no devengará intereses. El dinero que deposite con nosotros estará en una cuenta bancaria normal o en una cuenta de garantía bloqueada a nombre de Bet-me, quien guardará dicho dinero bajo fideicomiso a su favor y al del resto de personas autorizadas.

7.4 En la medida en la que requiera la legislación local aplicable o las autoridades fiscales competentes, usted será responsable de la notificación de las pérdidas y ganancias en las que haya incurrido al acceder a los servicios.

7.5 Con arreglo a la reglamentación aplicable, podrá depositar un máximo de 600 euros diarios; 1500 euros semanales y 3000 euros mensuales. No obstante, podrá autolimitar los depósitos a cualquier importe inferior al límite indicado de conformidad con la Cláusula 7.6. En el caso de que desee aumentar o eliminar los límites legales o los que se haya autoimpuesto, tendrá que cumplir con los términos y condiciones estipulados en nuestra Política de Juego Responsable.

7.6 Para obtener información sobre cómo fijar un límite de depósitos, póngase en contacto con nuestro departamento de atención al cliente o (en el caso de que su cuenta sea para la Página Web) podrá fijar el límite a través de la Página Web haciendo clic en Mi cuenta, y luego en Actualizar los datos de la cuenta. Toda reducción confirmada del límite de los depósitos surtirá efecto de manera inmediata.

7.7 Con sujeción a lo estipulado en la cláusula 12 (Cierre de su cuenta, etc.), podrá solicitar la retirada de fondos de su cuenta en cualquier momento siempre que:

7.7.1 se haya confirmado la realización efectiva de todos los pagos realizados a su cuenta y no se hayan producido devoluciones, revocaciones ni cancelaciones de los mismos;

7.7.2 se hayan finalizado las confirmaciones pertinentes a las que hace referencia la cláusula 5 con resultado satisfactorio; y

7.7.3 haya cumplido con todas las condiciones de retirada de fondos aplicables a su cuenta (por ejemplo, los Términos de los Bonos, si procede).

7.8 Con respecto a cualquier retirada de fondos que haya recibido nuestra aprobación, siempre y cuando nos facilite información suficiente acerca de cómo transferirle los fondos a su favor, le devolveremos los fondos pertinentes de conformidad con lo estipulado en el punto 7.7. (una vez deducidos los costes en los que se haya incurrido o cualquier otro importe que deba deducirse de su retirada con arreglo a la legislación aplicable).

7.9 Procesaremos y abonaremos las retiradas de fondos utilizando el mismo método de pago que usted haya utilizado para realizar los depósitos en su cuenta, siempre y cuando dicho método permita realizar un rembolso.

7.10 Mantendremos los fondos depositados en la cuenta de garantía bloqueada y/o de depósito a la que hace referencia el párrafo 7.3. en tanto que fideicomisarios y no en calidad de banqueros o deudores. Por consiguiente, sin perjuicio de lo estipulado en cualquier otra disposición de los presentes Términos de Uso, trataremos su dinero como fideicomisarios, sin que por ello se cree u origine ninguna obligación de pago por parte de Bet-me (o cualquier otra empresa del grupo) como si se tratase de un deudor.

7.11 Comisión por Cuenta Inactiva. En el caso de que no utilice su cuenta para apostar o jugar, realizando un depósito, una retirada o una transferencia, o si permanece inactiva por cualquier otro motivo, durante un periodo mínimo de 24 meses consecutivos, se considerará una Cuenta Inactiva. Todas las cuentas Inactivas generarán una comisión por cuenta Inactiva. Podrá encontrar información al respecto en la sección de Ayuda de la Página Web. Nosotros le comunicaremos cuando su cuenta pase a considerarse una cuenta Inactiva con una antelación mínima de 14 días antes de proceder al cargo de ninguna comisión por cuenta Inactiva.


8. USO LEGAL DE LA PÁGINA WEB

8.1 Puede que el acceso o uso de la Página Web o de cualquiera de los Servicios ofrecidos a través de la Página Web no sea legal para algunos o todos los residentes o personas de determinados países. La Página Web no deberá ser utilizada para apostar, jugar o para cualquier otro fin por aquellas personas de los países en los que dichas actividades se consideren ilegales, incluidos los Estados Unidos de América y los territorios del listado que figura en la sección de Ayuda de la Página Web. El hecho de que se pueda acceder a la Página Web desde los países mencionados o de que el contenido de la misma esté disponible en el idioma de esos países no se debe interpretar como una declaración o garantía relativa a la legalidad del acceso y uso de la Página Web y de la realización de depósitos o recibo de las ganancias en su cuenta. La disponibilidad de acceso a la Página Web no constituye una oferta, incitación o invitación por nuestra parte al uso de la misma ni a registrarse para apostar, jugar o participar en cualquiera de los servicios ofrecidos en aquellas jurisdicciones donde dichas actividades estén prohibidas por ley.

8.2 Usted será responsable de comprobar cuál es la legislación aplicable en el lugar en el que se encuentre. Se compromete a asegurarse de actuar de manera legal en su jurisdicción cuando abra su cuenta y/o utilice la Página Web.

8.3 Si nos constase que usted es residente en un país en el que el uso de la Página Web no sea legal podremos proceder inmediatamente a la cancelación de su cuenta, en cuyo caso procederemos a la devolución del saldo del que disponga en la cuenta en la fecha de cierre tan pronto como nos resulte posible.

8.4 Todas aquellas apuestas propuestas por los clientes que se declaren ilegales, incluidas pero no límitadas segun la normativa vigente serán eliminadas y puestas en conocimiento de la autoridad competente, la empresa se reserva el derecho de eliminar apuestas segun su propio criterio incurran o no en delito según la legislacion vigente del territorio en el que incurra.


9. CÓMO REALIZAR APUESTAS Y/O PARTICIPAR EN JUEGOS UTILIZANDO LOS SERVICIOS

Para apostar o acceder a algún servicio deberá seguir las instrucciones que figuran en la sección de Ayuda.

9.1 Es responsabilidad suya garantizar que el contenido de las apuestas propuestas por usted esten acordes con la legalidad cumpliento lo estipulado en el Articulo 8

9.2 Es responsabilidad suya garantizar que los datos de las apuestas o transacciones similares que realice utilizando los servicios (Transacciones) sean correctos en la siguiente manera:

9.3.1 cuando utilice la Página Web (ya sea directamente, a través de una aplicación o de forma similar), deberán ser conformes a las Reglas de Apuestas o Reglas del Juego correspondientes, según corresponda; y

9.4 Podrá acceder al historial de Transacciones haciendo clic en Mi Cuenta en la Página Web, o a través del equipo de atención al cliente (también podrá optar por recibir un extracto por escrito). Con arreglo a la reglamentación aplicable, guardaremos el historial de todas las Transacciones que realice durante un periodo de al menos seis (6) años tras el cierre de su cuenta.

9.5 Nos reservamos el derecho de rechazar la totalidad o parte de cualquiera de las Transacciones que solicite en cualquier momento, según juzguemos oportuno, o cuando haya incumplido los Términos de Uso. Ninguna Transacción se considerará aceptada por nosotros hasta que haya recibido la confirmación correspondiente (o hasta que la hayamos aceptado de otra manera) de conformidad con lo estipulado en la cláusula 9.2. Si tiene alguna duda sobre si alguna Transacción se ha aceptado con éxito puede ponerse en contacto con nuestro departamento de atención al cliente.

9.6 Una vez una Transacción haya recibido nuestra aceptación, no podrá cancelarla salvo que acordemos lo contrario.

9.7 Podremos, según estimemos oportuno (siempre y cuando no suponga una ventaja injusta para usted o para nosotros), optar por aceptar una apuesta aunque el evento en cuestión ya haya comenzado. Con respecto a los juegos de azar, en la pestaña de Reglas podrá encontrar información sobre el momento a partir del cual ya no podremos aceptar más apuestas.

9.8 Podremos cancelar o modificar cualquier Transacción de conformidad con lo estipulado en las cláusulas 5 (Comprobación de su Identidad), 11 (Colusión, Trampas, Fraude y Actividad Criminal) o 18 (Errores u Omisiones).


10. APUESTAS O JUEGOS A DISTANCIA

10.1 Cuando acceda a los Servicios a través de una forma electrónica de comunicación tendrá que tener en cuenta que:

10.1.1 Con relación al uso que haga de la Página Web para realizar apuestas o participar en juegos:

10.1.1.1 Puede que esté utilizando una conexión o un equipo más lento que el que utilicen los demás, lo que puede afectar a su rendimiento en aquellos eventos ofrecidos a través de la Página Web en los que el tiempo juegue un papel importante;

10.1.1.2 Puede encontrarse con errores o fallos del sistema o interrupciones del servicio que se tratarán de conformidad con lo estipulado en la cláusula 17 (fallos informáticos);

10.1.1.3 Las Reglas del Juego para cada evento o juego ofrecido a través de la Página Web estarán siempre a su disposición y tendrá que tomarlas en consideración antes de utilizar los servicios que ofrecemos a través de la Página Web; y

10.1.1.4 en aquellos juegos ofrecidos a través de la Página Web que se beneficien de más jugadores o de una mayor liquidez podremos hacer uso de jugadores electrónicos (conocidos como robots y cuyo nombre de usuario será bots) pre-programados para jugar y unirse al juego a modo de ayuda con respecto a la liquidez o al número de jugadores, si bien no usaremos bots sin dejar claro tal uso a los jugadores. Podemos confirmar categóricamente que no utilizamos jugadores electrónicos (conocidos como robots o bots) en nuestro software de Póker y tomaremos las medidas oportunas junto con nuestros proveedores de software para evitar su uso por parte de los usuarios de nuestros servicios; y

10.1.1.5 En relación con el uso de los Servicios, si está realizando una apuesta en un evento en curso, puede que no se le pueda facilitar o que no pueda acceder a la información más actualizada con respecto a dicho evento. No podemos garantizar que no se produzcan retrasos en la transmisión de información relativa a eventos en curso.


11. COLUSIÓN, TRAMPAS, FRAUDE Y ACTIVIDAD CRIMINAL

11.1 Las siguientes prácticas (o alguna de ellas) en relación con los Servicios:

? abuso de bonos u otras promociones; y/o

? uso de influencias o factores externos injustos (conocidos comúnmente como trampas); y/o

* obtener una ventaja injusta (tal y como se define en el párrafo 11.5.3.); y/o

* abrir cuentas duplicadas;

* permitir que un tercero utilice su cuenta;

? desarrollar actividades delictivas o prácticas fraudulentas (según se definen en el párrafo 11.5.)

(en lo sucesivo Prácticas prohibidas) no están permitidas y constituyen un incumplimiento sustancial de los presentes Términos de Uso. Nosotros tomaremos todas las medidas necesarias para prevenir y detectar este tipo de prácticas, así como para identificar a los jugadores involucrados en las mismas. No obstante, no asumiremos responsabilidad alguna por los daños o las pérdidas en las que haya incurrido como resultado de las Prácticas Prohibidas, y todas las acciones que emprendamos a tal efecto se llevarán a cabo según juzguemos oportuno.

11.2 En el caso de que sospeche que alguien esté implicado en una Práctica Prohibida, deberá comunicárnoslo tan pronto como le sea posible a través de un correo electrónico o llamando a nuestro equipo de atención al cliente.

11.3 Usted se compromete a no participar ni estar involucrado de ninguna forma con Prácticas Prohibidas en lo que respecta al acceso o uso de los servicios.

11.4 En el caso de que:

11.4.1 tengamos motivos suficientes para creer que ha participado o ha estado relacionado de algún modo con una práctica prohibida (para llegar a tal conclusión podemos utilizar -tanto nosotros, como nuestros socios de juego y proveedores- cualquiera de las prácticas disponibles de detección de actos de colusión, trampas y fraude que se utilicen en el sector de juegos en su momento); o

11.4.2 haya hecho apuestas y/o haya participado en línea en juegos con otro proveedor en línea de servicios de juegos y se sospeche (como resultado de dicho juego) que se esté dando una práctica prohibida o cualquier tipo de actividad indebida; o

11.4.3 nos conste que haya devuelto o rechazado alguna de las compras o depósitos realizados en su cuenta; o

11.4.4 esté incurso en un procedimiento de bancarrota o similar en alguna parte del mundo,

tendremos la facultad (además de poder suspender y/o cancelar su cuenta), con respecto a su cuenta (y/o a cualquier otra cuenta que tenga con una empresa del grupo Bet-me), de retener la totalidad o parte del saldo y/o recuperar de la cuenta el importe de los depósitos, desembolsos, bonos o ganancias que estén relacionados de alguna manera con los eventos descritos en el presente párrafo 11.4. o que se deriven de ellos. Todo ello sin perjuicio de cualquier otro derecho (incluidos aquéllos conferidos por el derecho común) que podamos ejercer contra usted, ya sea con arreglo a lo estipulado en los presentes Términos de Uso o de cualquier otro modo.

11.5 A los efectos de la presente cláusula 11:

11.5.1 por actividad fraudulenta se entiende cualquier tipo de actividad fraudulenta en la que esté implicado tanto usted como cualquier otra persona que actúe en su nombre o en connivencia con usted, entre otras: (a) rakebacks y devoluciones fraudulentas; (b) el uso como fuente de fondos, por su parte o por parte de otra persona que estuviera participando en el mismo juego al mismo tiempo, de tarjetas de crédito o debido robadas, duplicadas o no autorizadas por cualquier otro motivo; (c) la connivencia con terceros para obtener una ventaja injusta (ya sea a través de regímenes de bonos o de incentivos similares que ofrezcamos); (d) cualquier acción o acto que haya emprendido o intentado emprender y que nosotros tengamos motivos suficientes para considerar ilegal en la jurisdicción aplicable, realizado de mala fe o con el objetivo de estafarnos y/o sortear cualquier tipo de restricciones legales o contractuales, independientemente de que dicha acción u acto haya causado daños o no;

11.5.2 entre las actividades delictivas se incluyen el blanqueo de capitales y cualquier delito conforme a la legislación aplicable; y

11.5.3 el término ventajas injustas abarca, entre otras, la explotación de un error, laguna jurídica o fallo existente en nuestro software o el de terceros que usted utilice en relación con los servicios (con respecto a cualquier juego), el uso de jugadores automatizados (bots), o la explotación por su parte y en perjuicio nuestro o de otros jugadores de un Error según la definición que se le confiere en el párrafo 18.1.

11.5.4 Actitudes que promuevan en sus comentarios o apuestas propuestas delitos tipificados que incluyen pero no se limitan a xenofobia, violencia de género o exaltacion del terrorismo, asi como delitos de amenazas, injurias o contra el honor.

11.6 A la hora de ejercer nuestros derechos de conformidad con lo estipulado en el punto 11.4. en relación con alguna práctica prohibida, tomaremos cuantas medidas sean necesarias para garantizar el ejercicio de dichos derechos en una manera justa tanto para usted como para el resto de nuestros clientes, sin dejar de cumplir en ningún momento con nuestras obligaciones reguladoras y legales.

11.7 Facilitaremos sus datos personales a las autoridades españolas competentes en material de juegos en el caso de que creamos que esté involucrado en algún tipo de práctica prohibida. Asimismo, nos reservamos el derecho de informar a cualquier otra autoridad competente, operadores de juegos en línea, otros proveedores de servicios en línea y bancos, empresas de tarjetas de crédito, proveedores de pagos electrónicos u otras entidades financieras acerca de su identidad y de la sospecha de su participación en alguna práctica prohibida, en su caso, y usted se compromete a cooperar totalmente con nosotros en el transcurso de la investigación de dicha actividad.


12. CIERRE DE SU CUENTA; RESCISIÓN DE LOS TÉRMINOS DE USO

CIERRE Y RESCISIÓN POR DECISIÓN SUYA

12.1 Siempre y cuando en su cuenta no exista ningún saldo a nuestro favor, podrá en todo momento optar por cerrarla y rescindir los presentes Términos de Uso mediante notificación a tal efecto con una antelación mínima de 24 horas a través de nuestro equipo de atención al cliente, cuyos datos figuran en la sección de Ayuda de la Página Web:

12.1.1 indicando que desea cerrar su cuenta; y

12.1.2 señalando las razones por las que desea cerrar su cuenta, especialmente si lo hace porque le preocupe el nivel del uso que le dé.

Recibirá una respuesta por nuestra parte a su solicitud, confirmando el cierre de su cuenta y la fecha efectiva de cierre, en un plazo máximo de 24 horas desde la recepción de la comunicación de que su cuenta quedaría inactiva.

12.2 Una vez solicite el cierre de su cuenta con arreglo a lo estipulado en el punto 12.1. procederemos, con sujeción a lo estipulado en el punto 12.3., a la devolución de los saldos pendientes a su cuenta.

12.3 Una vez cerrada su cuenta con arreglo a lo estipulado en la presente cláusula 12 podremos (sin limitar nuestros derechos conforme a lo estipulado en el párrafo 12.6.) retener, del rembolso del balance pendiente a su cuenta, cualquier importe conforme a lo estipulado en (a) el punto 11 (Colusión, Trampas, Fraude y Actividad Delictiva), (b) el punto 20 (Incumplimiento de los Términos de Uso), (c) los presentes Términos de Uso (incluido, en su caso, el párrafo 5.4.), o (d) la legislación o reglamentación aplicable.

12.4 Para proceder al rembolso del saldo pendiente en su cuenta utilizaremos el mismo método de pago que usted haya facilitado al registrarse, o cualquier otro medio que usted elija, en su caso.

12.5 Aunque haya cerrado su cuenta, podremos en determinadas circunstancias reabrirla con los mismos datos si así nos lo solicita. En este caso, a pesar de que la cuenta se abra con los mismos datos que teníamos para la antigua, estará sujeta a los Términos de Uso vigentes en la fecha de reapertura y los derechos anteriores (incluidos, entre otros, los bonos o ganancias contingentes) ya no serán válidos. Se le pedirá que acepte expresamente la versión aplicable de los Términos de Uso.

CIERRE Y RESCISIÓN POR NUESTRA PARTE

12.6 Nosotros podremos en cualquier momento (sin perjuicio de lo estipulado en otras disposiciones de los presentes Términos de Uso) cerrar su cuenta y rescindir los presentes Términos de Uso mediante comunicación por escrito (o intento de comunicación) a sus datos de contacto. En este caso, con sujeción a lo estipulado en el punto 12.6., procederemos a rembolsar el saldo de su cuenta tan pronto como nos sea posible desde su petición a tal efecto.

12.7 En el caso de que procedamos a cerrar su cuenta y rescindir los presentes Términos de Uso con arreglo a lo estipulado en la cláusula 11 (Colusión, Trampas, Fraude y Actividad Delictiva) o en la cláusula 20 (Incumplimiento de los Términos de Uso), no tendrá derecho al rembolso del saldo de su cuenta y será confiscado en concepto de penalización por cualquier reclamación que tengamos contra usted a la fecha de cierre (ya sea con respecto a su cuenta, a alguna cuenta duplicada o similares). El cierre de su cuenta y la rescisión de los presentes Términos de Uso por motivos diferentes a los expuestos en los puntos 11 o 20 de los presentes Términos Generales no afectará a las apuestas pendientes, siempre y cuando se trate de apuestas válidas que no infrinjan los Términos de Uso en modo alguno. Para evitar cualquier duda, no abonaremos ningún bono en su cuenta ni tendrá derecho a ninguna ganancia contingente tras la fecha de cierre de la cuenta (ya sea por nuestra parte, de conformidad con los presentes Términos de Uso, o como respuesta a una petición suya a tal efecto).

12.8 Las cláusulas números 19, 20, 21, 22, 23, 25 y 34, así como cualquier otra que sea necesaria a los efectos de interpretación de los presentes Términos de Uso, permanecerán vigentes incluso después de su rescisión; junto con cualquier otra sección relevante de las Reglas de Apuestas y la Política de Privacidad.

SUSPENSIÓN POR NUESTRA PARTE

12.9 Podremos suspender su cuenta en el caso de que se produzcan las circunstancias expresamente indicadas a tal efecto en los Términos de Uso y/o la reglamentación aplicable. Tras la suspensión de su cuenta: (a) no se permitirá ningún tipo de actividad (incluidos depósitos, retiradas, apuestas o juegos) hasta la fecha en la que la reactivemos, (b) no se abonarán bonos ni ganancias contingentes, y (c) trataremos el motivo que haya provocado la suspensión de la cuenta con el objetivo de resolverlo lo antes posible para poder proceder a la reactivación o cierre de la cuenta, según proceda.


13. ACCESO A LOS SERVICIOS Y USO DE LOS MISMOS

13.1 Será responsabilidad suya disponer de y mantener todos los equipos informáticos y redes de telecomunicación y servicios de acceso a internet que necesite para acceder a los Servicios. Nosotros no seremos responsables en modo alguno por las pérdidas que le haya podido causar el proveedor de servicios de internet o de telecomunicaciones que usted haya contratado para acceder a los Servicios (derivadas de la pérdida del servicio, de una conexión deficiente a internet, de un ancho de banda insuficiente o por cualquier otro motivo). A estos efectos, Bet-me no ofrece garantía alguna con respecto a la compatibilidad de los servicios con ningún software o equipo informático en concreto.

13.2 Bajo ninguna circunstancia podrá utilizar los servicios con fines que se puedan considerar difamatorios, abusivos, obscenos, ilícitos o de naturaleza racista, sexista o discriminatoria, o que podrían ser motivo de ofensa. Queda prohibido el uso de imágenes o de vocabulario abusivo o agresivo, así como insultar, amenazar, acosar o injuriar a terceros, incluidos otros usuarios, a través de la Página Web, o intentar hacerse pasar por otra persona, o mostrar comportamientos similares con el personal de Bet-me que ofrece los servicios, el equipo de atención al cliente o cualquier persona que desempeñe funciones de ayuda o asistencia técnica.

13.3 Solamente podrá utilizar la Página Web para entretenimiento personal y no podrá facilitar el acceso a la misma ni reproducirla, en su totalidad o en parte, en ninguna forma, sin haber obtenido consentimiento previo a tal efecto, incluida la creación de enlaces a la misma.

13.4 Usted será el único responsable con respecto a cualquier contenido que cargue en la Página Web (Contenido Cargado) y siempre que cargue o suba contenido declara y garantiza:

13.4.1 haber obtenido previamente todas las aprobaciones, consentimientos, licencias y permios que se requieran con respecto al contenido cargado y que la reproducción del mismo en la Página Web no infringe los derechos de autor, de marca registrada, de información confidencial o cualquier otro derecho de propiedad intelectual de terceros;

13.4.2 que el contenido cargado no contiene ningún material que incumpla lo estipulado en la cláusula 13.2. o cualquier código que incumpla lo estipulado en la cláusula 13.3;

13.4.3 que el contenido cargado cumple con todas las normativas y legislación aplicables (incluidas, en especial, aquéllas relativas a la privacidad y protección de datos); y

13.4.4 que Bet-me está facultado a usar y sub-licenciar el uso del contenido cargado según estime oportuno.

13.5 Toda descarga de material desde la Página Web (salvo el Software mencionado en la cláusula 16) la realizará a su cuenta y riesgo. Bet-me no se responsabilizará por las pérdidas de datos u otros daños causados con motivo de la descarga.

13.6 En el caso de que tengamos motivos para creer que el uso que haga de los servicios infringe lo estipulado en los puntos 13.2 podremos, sin perjuicio de cualquier otro derecho que podamos ejercer, retirar inmediatamente de la Página Web cualquier contenido ofensivo.


14. TÉRMINOS APLICABLES A LAS APUESTAS Y A LOS JUEGOS

14.1 En el sector de los juegos de azar existen numerosas expresiones relacionadas con las apuestas y los juegos. Siempre que sea necesario, tendrá a su disposición un glosario en donde se explique el significado de las expresiones de apuestas y juegos empleadas habitualmente a través de las secciones de Ayuda de la Página Web. En el caso de que tenga alguna duda con respecto al significado de alguna expresión, podrá:

14.1.1 buscar su significado en el glosario de la sección de Ayuda correspondiente al evento o juego en el que esté participando (apuesta o juego);

14.1.2 si aún así alberga dudas, póngase en contacto con el equipo de atención al cliente para que le realice las aclaraciones oportunas; y

14.1.3 no apueste ni juegue hasta haber comprendido totalmente su significado,

porque no debería aceptar ningún tipo de responsabilidad al apostar o jugar utilizando los productos ofrecidos a través de los servicios si no entiende alguno de los términos relacionados con la apuesta o juego en cuestión.


15. MODIFICACIÓN DE LA PÁGINA WEB

Podremos, a nuestro exclusivo criterio, modificar o cambiar cualquiera de los productos o servicios (incluidos los precios de los mismos) disponibles a través de la Página Web en cualquier momento con el objetivo de garantizar la continuidad de la misma, sin que ello afecte a los juegos y/o apuestas ya en curso en el momento de dicha modificación. En determinadas ocasiones podremos restringir el acceso a partes de la Página Web para poder realizar el mantenimiento de la misma y/o modificar los juegos y/o productos disponibles.


16. SOFTWARE DE TERCEROS

16.1 Puede que sea necesario suministrarle software (Software) de terceros para que pueda utilizar los productos ofrecidos a través de los servicios.

16.2 En estos casos, puede que tenga que firmar otro contrato con el propietario del software correspondiente relativo a su uso (un Contrato de Software de Terceros). En caso de contradicción entre las disposiciones de los Términos de Uso y las del Contrato de Software de Terceros, prevalecerán los Términos de Uso siempre y cuando la contradicción en cuestión sea relativa a la relación existente entre usted y Bet-me.

16.3 Será responsabilidad suya asegurarse de que cualquier Software que se descargue en su ordenador se descargue de manera compatible con la configuración específica del mismo. Para evitar cualquier malentendido, nosotros quedamos exentos de cualquier responsabilidad por los efectos adversos que una descarga incorrecta de Software pueda ocasionar en el funcionamiento de su ordenador.

16.4 Todos los Servicios que se le ofrezcan a través de smartphones o aplicaciones para dispositivos móviles (Apps) estarán sujetos a los presentes Términos de Uso. Las condiciones en las que se descarga o instala una determinada aplicación en su smartphone o dispositivo móvil quedarán reguladas por el contrato correspondiente que haya firmado con el proveedor de la aplicación pero, en caso de discrepancia entre los Términos de Uso y dicho contrato, prevalecerán los Términos de Uso siempre y cuando la discrepancia en cuestión sea relativa a la relación existente entre usted y Bet-me.


17. FALLOS INFORMÁTICOS

17.1 Siempre que se produzcan problemas en el software o equipo informático que utilizamos para suministrar los Servicios tomaremos cuantas medidas sean necesarias para solucionar el problema lo antes posible. Cuando dichos problemas causen la interrupción de un juego en circunstancias en las que no se pueda reiniciar desde el mismo punto sin perjudicarle a usted o a otros jugadores, tomaremos las medidas oportunas para tratarle de manera justa (podremos incluso optar por restituir el saldo en su cuenta a la situación en la que se encontraba tras finalizar la última apuesta o juego registrado en el servidor de Bet-me justo antes de que surgiera el problema). Bet-me no garantiza el funcionamiento y la disponibilidad constantes de todos los productos ofrecidos. Bet-me posee un plan de contingencias que se activará siempre que la Página Web o la plataforma de software se encuentre inoperativa por el motivo que sea. No obstante, Bet-me no garantiza que el software o los servicios cumplan con los requisitos del cliente o del jugador, que no sufran interrupciones, que no contengan errores, que se corrijan los defectos, ni que el software o el servidor que los pone a disposición del jugador no contenga virus ni bugs. Asimismo, tampoco garantiza la total funcionalidad, exactitud y fiabilidad de los materiales ni los resultados ni la exactitud de cualquier información obtenida a través de los servicios.

17.2 Quedamos exonerados de toda responsabilidad con respecto a los problemas que pueda ocasionar el equipo que tanto usted como otros jugadores utilicen para acceder a los Servicios, o a los fallos relacionados con su proveedor de servicios de internet.

17.3 Además, nos reservamos el derecho de interrumpir temporalmente el Servicio, previo consentimiento a tal efecto por parte de las autoridades españolas en materia de juegos, sin necesidad de previo aviso, por necesidades organizativas o razones de mantenimiento del sistema, sin perjuicio de sus derechos. No obstante, se pondrán en marcha los planes de contingencia oportunos siempre que los Servicios estén inoperativos por el motivo que sea.


18. ERRORES U OMISIONES

18.1 Puede que se dé el caso de que aceptemos una apuesta o realicemos un pago por error. A continuación se ofrece una lista no exhaustiva de los casos que se pueden dar:

18.1.1 cuando se confunden o tergiversan las cuotas o los términos de una apuesta o juego como resultado de un error o de una omisión evidente en la información o configuración de un mercado, o como resultado de un malfuncionamiento informático;

18.1.2 cuando hayamos cometido un error palpable. Se produce un error palpable cuando:

18.1.2.1 en relación con las apuestas realizadas antes de producirse un evento, los precios/términos ofrecidos son sustancialmente distintos a los disponibles en el mercado general; o

18.1.2.2 en relación con un evento, los precios/términos ofrecidos a el momento de realizar la apuesta son claramente incorrectos teniendo en cuenta la probabilidad de que se produzca el evento;

18.1.3 cuando hayamos continuado aceptando apuestas en un mercado en el que deberían haber sido suspendidas, aunque el evento en cuestión esté ya en curso (salvo los casos en los que se acepten apuestas en curso) o ya haya finalizado (a veces se les conoce como apuestas tardías);

18.1.4 cuando se haya producido un error como resultado de una práctica prohibida con arreglo a lo estipulado en la cláusula 11.1. (incluidos los casos en los que con motivo de dicha práctica prohibida se hayan abonado fondos en su cuenta o usted haya retirado fondos de la misma);

18.1.5 cuando no deberíamos haber aceptado, o tenido el derecho de cancelar o volver a abonar una apuesta de conformidad con las Reglas del Apuestas (por ejemplo, debido a Contingencias Relacionadas);

18.1.6 cuando hayamos cometido un error con respecto al importe de las ganancias/rembolsos que abonamos a su favor, aunque sea como resultado de un error informático o manual; o

18.1.7 cuando hayamos cometido un error con respecto al importe de apuestas libres y/o bonos que abonemos en su cuenta,

y todos estos casos se denominarán Errores.

18.2 Nos reservamos el derecho a:

18.2.1 Cuando no se pueda razonablemente corregir o saldar la apuesta atendiendo al punto 18.2.1 superior, las apuestas se declararán nulas y la cantidad apostada se devolverá: o

18.2.2 enmendar cualquier Error que se haya cometido con respecto a una apuesta y volver a abonarla al precio correcto o en los términos que estaban disponibles o deberían haber estado disponibles a través de Bet-me (salvo el error en cuestión) en el momento en el que se haya realizado la apuesta y se considerará que la apuesta se realizó conforme a los términos habituales para la misma; o

18.2.3 en los casos en los que el error se produzca con motivo de una práctica prohibida, tomar las medidas estipuladas en el punto 11.4.

18.3 Todo importe que le haya sido abonado en su cuenta o pagado de otro modo como resultado de un error se tratará, hasta haber solucionado el problema conforme a lo estipulado en el punto 18.2, como una cantidad que usted mantiene en fideicomiso a nuestro favor y que nos será devuelta de manera inmediata tras un requerimiento por nuestra parte a tal efecto. De producirse alguno de estos casos, si dispone de fondos en su cuenta podemos recuperarlos con arreglo a lo estipulado en el punto 7.4. No obstante, nos comprometemos a tomar las medidas necesarias para detectar cualquier tipo de error y comunicarle su existencia tan pronto como nos sea posible.

18.4 Tanto nosotros (o nuestros empleados y agentes) como nuestros socios o proveedores quedamos exonerados de cualquier responsabilidad por pérdidas, incluidas las pérdidas de ganancias, que se deriven de un error que hayamos cometido nosotros o que haya cometido usted.

18.5 En caso de que le conste que se haya producido un error, deberá notificárnoslo lo antes posible.

18.6 En el caso de que haya utilizado los fondos que se le hayan abonado en su cuenta o que se le hayan pagado como resultado de un error para realizar otras apuestas o para jugar, podremos cancelar las apuestas mencionadas y/o retener cuantas ganancias haya obtenido utilizando dichos fondos. En el caso de que ya hayamos procedido a abonar dichas apuestas o juegos, los importes así abonados se tratarán como una cantidad que usted mantiene en fideicomiso a nuestro favor y que nos será devuelta de manera inmediata tras un requerimiento por nuestra parte a tal efecto.

18.7 En el caso de que en su cuenta haya fondos provenientes de (a) apuestas y/o juegos en los que haya participado de forma adecuada y otros (b) de apuestas y/o juegos en los que haya participado utilizando los fondos derivados de un error, a los efectos de este contrato y con el objetivo de una recuperación adecuada de los mismos, se considerará que dichos fondos provienen en su totalidad de apuestas y/o juegos en los que haya participado utilizando dinero resultante de un error, en la medida en la que sea necesaria para recuperar el importe requerido para enmendar el error en cuestión conforme a lo estipulado en la presente cláusula 18 y en el punto 11.4. El saldo restante en su cuenta, una vez hayamos recuperado el importe correspondiente, se tratará como fondos provenientes de apuestas y/o juegos en los que haya participado de manera correcta con sus propios fondos.


19. RESPONSABILIDAD

19.1 El acceso a los servicios será voluntario y correrá por su cuenta y riesgo.

19.2 Nosotros suministraremos los servicios con la debida diligencia y de conformidad con el contenido de los Términos de Uso. No realizamos ninguna otra promesa ni garantía con respecto a los servicios, ni a los productos o servicios que los integran, y excluimos por medio del presente (en la medida en la que el derecho aplicable lo permita) toda garantía implícita relativa a los mismos (incluidas las garantías implícitas relativas a la calidad satisfactoria y/o idoneidad de los servicios). En especial, no garantizamos una disponibilidad continua de la Página Web ni que no contenga bugs, virus u otros errores.

19.3 Nada de lo estipulado en los Términos de Uso podrá excluir nuestra responsabilidad en caso de:

19.3.1 fraude (incluida cualquier tergiversación fraudulenta); o

19.3.2 fallecimiento o daños personales causados con motivo de negligencia por nuestra parte.


20. INCUMPLIMIENTO DE LOS TÉRMINOS DE USO

20.1 Usted nos exonera de toda responsabilidad tanto a nosotros como a nuestros directivos, directores, empleados, agentes, contratistas y proveedores con respecto a las pérdidas, costes, gastos, reclamaciones, demandas y daños (incluidas las costas legales) que se puedan producir, de manera predecible o no, como resultado de:

20.1.1 el acceso a los Servicios y su uso por usted o alguien que utilice su nombre de usuario y contraseña; y/o

20.1.2 un incumplimiento por su parte de alguno de los términos o disposiciones aquí incluidos.

20.2 En el caso de incumplimiento de los Términos de Uso por su parte, podremos, antes de suspender o cancelar su cuenta, notificarle (utilizando sus datos de contacto) que se encuentra en una situación de incumplimiento, exigiéndole que ponga remedio a tal efecto y avisándole de las acciones que pretendemos emprender en caso contrario. Dicha notificación no se considerará nunca una condición obligatoria previa a la suspensión o cancelación de su cuenta.

20.3 Tenemos derecho a deshabilitar cualquier contraseña o código de identificación de usuario, independientemente de que lo haya escogido usted o se lo hayamos designado nosotros, en cualquier momento, siempre que tengamos motivos para considerar que ha infringido alguna de las disposiciones de los presentes Términos de Uso.

20.4 Además de cualquier otra vía de remedio disponible, en el caso de incumplimiento por su parte de los presentes Términos de Uso, podremos congelar su cuenta (incluidos los fondos que posea en ella) hasta que haya remediado la situación o, en caso de que ya se haya emprendido un procedimiento a tal efecto, hasta que éste se haya resuelto de conformidad con las disposiciones contenidas en el presente documento.


21. DERECHOS DE PROPIEDAD INTELECTUAL

21.1 Todos los diseños de la web, los textos, gráficos, música, sonido, fotografías, vídeos, la selección y disposición de los mismos, compilaciones de software, códigos fuente subyacentes, software y cualquier otro material que contenga la página y que forme parte de los servicios están protegidos por derechos de autor y otros derechos de propiedad, ya sean bajo nuestra titularidad o utilizados bajo licencia de terceros. Siempre que el material que contienen los servicios tenga que descargarse o imprimirse, ha de hacerse en un único dispositivo única y exclusivamente para su propio uso personal y nunca para fines comerciales.

21.2 El uso de los servicios no le hará partícipe en ningún caso de los derechos de propiedad intelectual (por ejemplo derechos de autor, know-how o marcas registradas) de los que nosotros u otros terceros somos propietarios. Lo único que se le concede es una licencia personal, no exclusiva y no sublicenciable para utilizar dichos derechos de propiedad intelectual en relación con el uso personal y no comercial que haga de los servicios con arreglo a los presentes Términos de Uso.

21.3 No se concede ningún tipo de derecho para utilizar o reproducir las marcas registradas o logos que aparecen en la Página Web, salvo que se permita específicamente de conformidad con los Términos de Uso.

21.4 No podrá copiar, almacenar, publicar, alquilar, licenciar, vender, distribuir, modificar, complementar, eliminar, borrar ni manipular la totalidad o parte de la Página Web, ni interferir o modificar en modo alguno (o intentar interferir o modificar en modo alguno) su contenido, directa o indirectamente, ni permitir que terceros lo hagan, salvo en la medida necesaria para ver o utilizar la Página Web de conformidad con los presentes Términos de Uso.

21.5 Todos los derechos de propiedad intelectual a nombre de Bet-me y Paperbet, los logos, diseños, marcas registradas y otros signos distintivos de la marca de Bet-me, así como el contenido para la Página Web que suministra Bet-me o algún tercero, recaen en Bet-me o en el tercero correspondiente. Usted se compromete a no exponer ni utilizar dichos logos, diseños, marcas registradas u otros signos distintivos de la marca en modo alguno sin haber obtenido nuestro consentimiento previo y por escrito a tal efecto.


22. VIRUS, PIRATERÍA INFORMÁTICA Y OTROS DELITOS

22.1 Queda prohibido:

22.1.1 corromper la Página Web;

22.1.2 intentar obtener acceso no autorizado a la Página Web, a los servidores en donde se almacena o a cualquier otro servidor, ordenador o base de datos asociados a la Página Web;

22.1.3 inundar la Página Web con información, entradas múltiples o spam;

22.1.4 utilizar deliberadamente o con negligencia cualquier función que afecte de algún modo al funcionamiento de la Página Web, por ejemplo, liberando o propagando virus, gusanos, troyanos, bombas lógicas o material similar de naturaleza malintencionada y dañina;

22.1.5 interferir con, modificar, eliminar o cambiar de algún modo la información contenida en la Página Web;

22.1.6 atacar la Página Web a través de un ataque de rechazo de servicio o un ataque de rechazo de servicio distribuido. Notificaremos cualquier sospecha de incumplimiento de la Ley sobre Delitos Informáticos de 1990 a las autoridades competentes y colaboraremos con ellas facilitándoles su identidad. De producirse un incumplimiento de estas características, su derecho a utilizar la Página Web quedará inmediatamente revocado.

22.2 No garantizamos que la página no vaya a sufrir ataques de rechazo de servicio distribuidos, o que no contenga virus u otro material tecnológicamente dañino que pueda infectar su equipo informático, programas informáticos, datos u otro material con motivo de uso que haga de la Página Web o al descargar el material en ella contenido, o en otra Página Web vinculada a la nuestra.


23. SU INFORMACIÓN PERSONAL

23.1 Toda la información que tengamos sobre usted en su cuenta la tratamos y almacenamos de manera segura y confidencial, salvo que se indique lo contrario en los Términos de Uso (incluida la Política de Privacidad).

23.2 La Ley nos exige, que cumplamos los requisitos de protección de datos en la forma en que recopilemos su información personal en su uso de la Web y el servicio de Apuestas Telefónicas. Por lo tanto, nos tomamos muy en serio nuestras obligaciones en relación con la manera en la que usamos su información personal

23.3 Cuando utilice los servicios tendremos que recopilar determinada información sobre usted, incluido su nombre, fecha de nacimiento, datos de contacto, y, en algunos casos, información sobre sus preferencias comerciales (en lo sucesivo denominada colectivamente su Información Personal).

23.4 Al facilitarnos su información personal, acepta que la tratemos, incluida aquella de naturaleza especialmente sensible,

23.4.1 con los fines estipulados en los Términos de Uso (incluida la Política de Privacidad); y

23.4.2 con cualquier otro fin cuando tengamos que tratar su información personal para ofrecer los Servicios,

Además, podremos compartirla con nuestros proveedores de servicio y agentes con los fines indicados, por ejemplo con nuestros suministradores de servicios postales, de marketing y nuestros agentes de atención al cliente. También podremos vernos obligados a divulgar su Información Personal para cumplir con alguna obligación regulatoria o legal.

23.5 Guardaremos copia de todas las comunicaciones que nos envíe (incluidos los correos electrónicos) para poder mantener archivos exactos y precisos de la información que hayamos recibido de usted. Además, también guardaremos una versión de los Términos de Uso que haya aceptado durante un periodo de seis (6) años después de que haya cancelado su Cuenta. Durante dicho periodo de tiempo, su información personal permanecerá bloqueada, y una vez transcurridos los seis años, será eliminada.


24. USO DE COOKIES EN LA PÁGINA WEB

24.1 En la Página Web se utilizan cookies para rastrear del uso que haga de la web y para ayudar a la funcionalidad de la misma. Un cookie es un archivo de texto de pequeño tamaño que se descarga en su ordenador cuando accede a la Página Web y permite reconocerle cuando vuelve a acceder. Utilizamos cookies para el funcionamiento de la Página Web, por ejemplo, para permitir que siga registrado mientras navega por diferentes partes de la Página Web y utiliza su cuenta para apostar o jugar en las mismas. También utilizamos cookies para nuestros propios fines analíticos para identificar cuándo se han encontrado problemas técnicos nuestros clientes, con el objetivo de ayudarnos a mejorar la experiencia del cliente.

24.2 En el caso de que desee oponerse al uso de cookies o quiera eliminar aquellos cookies que ya estén almacenados en su ordenador, le recomendamos que siga las instrucciones para la eliminación de cookies existentes y para deshabilitar cookies futuros en su software de gestión de archivos. Para obtener más información sobre la eliminación o el control de cookies consulte nuestra Política de Privacidad o visite www.aboutcookies.org. Le recordamos que si borra nuestros cookies o deshabilita los cookies futuros puede que no tenga acceso a determinadas zonas o funciones de la web.


25. RECLAMACIONES Y NOTIFICACIONES

25.1 Ninguna reclamación o disputa con respecto a:

25.1.1 la aceptación o abono de una apuesta que haya realizado utilizando los Servicios se tomará en consideración transcurridos 30 días desde la fecha de la transacción original; y

25.1.2 un juego en el que haya participado utilizando los Servicios se tomará en consideración transcurridas 12 (doce) semanas desde que el juego o la transacción correspondiente tuviera lugar.

25.2 En el caso de que desee realizar una queja relativa a los Servicios, en primer lugar tendrá que ponerse en contacto lo antes posible con nuestro equipo de atención al cliente a tal efecto, quien derivará la queja al superior jerárquico correspondiente hasta su resolución.

25.3 En el caso de que surja una disputa derivada de los presentes Términos de Uso que nuestro equipo de atención al cliente, después de derivarla a la persona adecuada conforme a lo estipulado en el punto 25.2., no pueda resolver, puede solicitar que un gerente o supervisor trate el tema. Haremos lo posible para resolver la cuestión pertinente de manera satisfactoria para usted de forma inmediata o poniéndonos en contacto con usted lo antes posible.

25.4 Si no quedase satisfecho con la solución que le proponemos, acepta someter la disputa a arbitraje con las autoridades españolas competentes en materia de juego, teniendo en cuenta que el laudo resultante se considerará final y vinculante para ambas partes. Para obtener más información sobre los servicios de resolución de conflictos de las autoridades españolas competentes, visite la página de la Comisión Nacional del Juego .Nos reservamos el derecho de retener el pago de cualquier evento que sea objeto de investigación con motivo de una actividad corrupta.

Grabaremos todas las transacciones telefónicas y electrónicas que hayamos realizado con usted en interés de ambas partes, y usted presta su consentimiento a tal efecto. Cuando surja una disputa que no pueda ser resuelta, facilitaremos las grabaciones correspondientes a las autoridades españolas en materia de juegos.

25.5 De manera adicional o alternativa,los conflictos se podrán someter a arbitraje a través del Servicio Independiente de Arbitraje de Apuestas (IBAS), cuyo número de teléfono es el +44 207 347 5883. Puede obtener más información sobre el IBAS en www.ibas-uk.com. El laudo dictado por el Ibas se considerará final siempre que todas las partes implicadas presenten la totalidad de los hechos. Le podemos facilitar la dirección postal del IBAS si así nos lo solicita.

25.6 Reconoce y acepta que nuestro generador de números aleatorios determinará el resultado de los juegos en los que participe a través de los Servicios y se compromete a aceptar el resultado de dichos juegos. También acepta que, en el caso improbable de que se produzca un desacuerdo entre el resultado que aparece en su pantalla y el servidor utilizado por Bet-me, prevalecerá el resultado que aparezca en el servidor de juegos, y que nuestros registros se tomarán en consideración para determinar los términos y circunstancias de su participación en la actividad de juego en línea correspondiente y los resultados de dicha participación.

25.7 Cuando tengamos que ponernos en contacto con usted lo haremos utilizando sus datos de contacto. Se considerará que las notificaciones han sido debidamente entregadas y recibidas por usted inmediatamente después de haber enviado un correo electrónico y obtenido confirmación de entrega, o después de habernos puesto en contacto con usted directamente por teléfono (incluso en el caso de que le hayamos dejado un mensaje de voz), o de haberle realizado la notificación por algún medio certificado. Para justificar la entrega de alguna notificación, bastará con probar, en el caso de una carta, que se ha enviado sellada y a la dirección correcta; y en el caso de un correo electrónico, que se ha enviado a la dirección de correo que usted hubiese especificado (en su caso) en sus datos de contacto en el momento de envío.


26. CESIÓN DE DERECHOS Y OBLIGACIONES

26.1 Nos reservamos el derecho de transferir, asignar, entregar u otorgar sublicencias sobre la totalidad o parte de los Términos de Uso (asignación) a terceros, siempre que dicha cesión o asignación haya recibido la aprobación de las autoridades españolas competentes en materia de juegos o el organismo que posea las competencias correspondientes en su momento. Usted no podrá asignar, otorgar sublicencias, transferir ni ceder en modo alguno los derechos u obligaciones contraídas conforme a los presentes Términos de Uso.


27. ACONTECIMIENTOS FUERA DE NUESTRO CONTROL

27.1 Quedamos exonerados de todo tipo de responsabilidad por no poder cumplir con las obligaciones contraídas en los presentes Términos de Uso, o por el retraso en el cumplimiento de las mismas, siempre que el motivo sean acontecimientos que se escapen a nuestro control, incluidos (entre otros) fallos en las redes de telecomunicación, cortes de suministro, fallos en los equipos informáticos de terceros, incendios, tormentas, explosiones, inundaciones, condiciones climatológicas extremas, cierres o disputas industriales y actos gubernamentales o de otras autoridades competentes (en lo sucesivo, Causa de Fuerza Mayor).

27.2 El cumplimiento de nuestras obligaciones quedará suspendido durante el periodo que dure la Causa de Fuerza Mayor, disponiendo posteriormente de una ampliación equivalente en el tiempo para cumplir con nuestras obligaciones. Haremos lo que esté en nuestras manos para poner fin a la Causa de Fuerza Mayor lo antes posible y para encontrar una solución para poder cumplir con nuestras obligaciones a pesar de que se haya producido una Causa de Fuerza Mayor.


28. CLÁUSULA DE RENUNCIA

28.1 En el caso de que no insistamos en el cumplimiento estricto de alguna de las obligaciones que usted haya adquirido o que no ejerzamos los derechos o vías de remedio disponibles a tal efecto, esto no significa que renunciemos a los derechos o vías de remedio que nos han sido conferidos y no le eximirá del cumplimiento de dichas obligaciones.

28.2 La renuncia por nuestra parte a tomar medidas ante un incumplimiento no constituirá una renuncia a tomar medidas por incumplimientos posteriores.

28.3 Ninguna renuncia por nuestra parte de las disposiciones de los Términos de Uso será efectiva salvo que se indique expresamente como tal y que se le notifique por escrito de conformidad con lo dispuesto en la cláusula 25 (Quejas y Notificaciones).


29. DIVISIBILIDAD

29.1 En el caso de que alguna autoridad competente determine que alguno de los Términos de Uso sea inválido, ilegítimo o inaplicable en algún modo, dicho término, condición o disposición se separará del resto de los términos, condiciones y provisiones, que continuarán siendo válidas en el más amplio sentido permitido por ley.

29.2 En estos casos, la parte considerada inválida o inaplicable se modificará de manera coherente con la legislación aplicable, reflejando, tan fielmente como sea posible, la intención original de Bet-me.


30. INTEGRIDAD DEL CONTRATO

30.1 Los Términos de Uso, así como cualquier otro documento al que hagan referencia expresamente, constituyen la totalidad del contrato entre usted y nosotros y sustituyen a cualquier otro contrato, acuerdo o pacto entre las partes, ya sea oral o escrito.

30.2 Ambas partes declaran no haber recibido garantías, declaraciones o promesas de la otra, expresas o implícitas como consecuencia de negociaciones orales o escritas, salvo las que se indican expresamente en los presentes Términos de Uso.

30.3 Ninguna de las partes tendrá derecho a tomar medidas con respecto a declaraciones inciertas realizadas por la otra, ya sean orales o escritas, con carácter previo a la fecha de formalización del presente contrato (salvo que se hubiesen realizado de manera fraudulenta) y la única vía de recurso de que dispondrán las partes será por incumplimiento del contrato según se estipula en los Términos de Uso.


31. DERECHO Y JURISDICCIÓN APLICABLES

31.1 Los presentes Términos de Uso serán regidos e interpretados de conformidad con el derecho español.

31.2 Los juzgados y tribunales de España serán competentes para resolver sobre cualquier disputa derivada de los presentes Términos de Uso.

32. VIGENCIA DE LOS TÉRMINOS DE USO

32.1 El presente contrato permanecerá indefinidamente en vigor hasta que alguna de las partes lo rescinda con arreglo a las disposiciones del mismo.


33. ENLACES

33.1 Los hipervínculos existentes a otras páginas web se indican únicamente con fines informativos. El uso que de ellos haga correrá por su cuenta y riesgo y nosotros no aceptamos responsabilidad alguna por el contenido o uso de dichas páginas web, ni por la información en ellas contenida. No podrá crear enlaces a nuestra página ni enmarcarla sin nuestro consentimiento expreso a tal efecto.


34. CONTACTO

Puede ponerse en contacto con Bet-me por correo postal enviado a las direcciones indicadas en la cláusula 2.1.; por correo electrónico a través de la sección de Contáctenos; o por teléfono."</textarea>
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
		// Está en España
		if(latitude > 36 && latitude < 43.8){
			if(longitude > -9.3 && longitude < 4.33){
				//alert("Estás en España");
				$.cookie("language", "es", {path: '/'});
				$(window).attr('location', url+"?language=es");
			}
			
		}else{
			// Está en Canarias
			if(latitude > 27.61 && latitude < 29.32){
				if(longitude > -18.17 && longitude < -13.41){
					//alert("Estás en Canarias");
					$.cookie("language", "es", {path: '/'});
					$(window).attr('location', url+"?language=es");
				}
			}else{
				//alert("Estás fuera de España");
			}
		}
	}
</script>