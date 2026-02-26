---
author: Jordi Ustrell Garrigos
date: 2026-02-18T11:00:00.000Z
---

# Información adicional

Hola a todos y a todas,

En este mensaje quiero facilitaros información útil para el desarrollo de vuestras aplicaciones web.

Antes de nada os dejo un **enlace donde podréis consultar los TFG y TFM realizados por otros estudiantes y que os pueden servir un poco de guía y ejemplo** sobre cómo realizar la memoria y el resto de documentos necesarios para la entrega final:

[http://openaccess.uoc.edu/webapps/o2/handle/10609/47986](http://openaccess.uoc.edu/webapps/o2/handle/10609/47986)

## Ventajas por formar parte de la UOC.

Soy consciente que para muchos de vosotros este es vuestro último semestre y que muchos ya las conoceréis, pero nunca está de más recordar que por ser estudiantes de la UOC tenéis acceso a algunas herramientas de manera totalmente gratuita y estas son:

- [**Office 365** Enlaces a un sitio externo.](https://products.office.com/es-es/student?tab=students): Tenéis acceso a todas las herramientas de office 360 online, así como las aplicaciones para vuestros dispositivos móviles y podréis instalar Office en vuestros ordenadores personales.
- [**OnTheHub** Enlaces a un sitio externo.](https://e5.onthehub.com/WebStore/ProductsByMajorVersionList.aspx?ws=cdfb516e-699b-e011-969d-0030487d8897&vsro=8&JSEnabled=1): Desde esta página tenéis acceso a algunos programas de pago con descuento o de manera gratuita, entre ellos todas las aplicaciones de JetBrains, algunas de las cuales os pueden resultar útiles para realizar vuestro TFG.
- [**O'Reilly** Enlaces a un sitio externo.](https://www.oreilly.com/sign-in.html): Con vuestro usuario de la UOC tendréis acceso a una gran cantidad de libros formativos y que pueden ser de vuestro interés. Lo que tenéis que hacer es identificaros con vuestro correo de la UOC y luego se os redirigirá a la página de identificación de la UOC.
- [**Adobe Creative Cloud** Enlaces a un sitio externo.](https://e5.onthehub.com/WebStore/ProductsByMajorVersionList.aspx?cmi_cs=1&cmi_mnuMain=2027b68c-8d6a-e911-8115-000d3af41938&ws=55da2783-4d76-e811-8106-000d3af41938&vsro=8): Con vuestro usuario de la UOC tendréis acceso a una gran número de aplicaciones de Adobe.

Dicho esto, a continuación, os comento algunas cosas que os pueden ser útiles para el desarrollo del TFG y para tomar decisiones de cara a la PEC1.

## Desarrollo del Back-end:

Para el desarrollo de los Back-end de vuestros TFG podéis optar por diferentes lenguajes de programación, los cuales son:

- **PHP** puro o usar frameworks como Symfony, Laverel, CodeIgniter, CakePHP o Phalcon.
- **Python** con los frameworks Django, Pyramid o Web2py.
- **Java** usando Servlets o frameworks como Spring, Dropwizard o Blade.
- **JavaScript** con Node.js y frameworks como Express.js, Koa2, Sails.js o NestJS.
- **Ruby** usando frameworks como Ruby on Rails, Sinatra o Padrino.
- **GoLang** con frameworks como Echo, Beego, Iris o Revel.
- **.NET**

## Desarrollo del Front-end:

Aquí está claro que no tenemos muchas opciones, tendremos que utilizar a la fuerza **HTML5, CSS3 y JavaScript**.

Si lo deseáis podéis utilizar jQuery pero actualmente, con la evolución que ha sufrido JavaScript, este está siendo cada vez menos utilizado, ya que el rendimiento utilizando JavaScript nativo es mucho mayor que usando jQuery, quedando este último relegado a realizar mantenimientos en proyectos antiguos, para desarrollos compatibles con navegadores antiguos o simplemente para poder utilizar algunos plugins existentes.

Lo que sí que se utiliza cada vez más y está siendo muy demandado a nivel empresarial son conocimientos en la utilización de frameworks JavaScript. Los más importantes y que os aconsejaría que aprendierais alguno para el desarrollo del TFG son:

- **Angular**, actualmente el más demandado.
- **ReactJs**, cada día está cobrando mayor importancia y es el segundo más demandado. La curva de aprendizaje es menor que la de Angular.
- **VueJs**, este es quizás el más fácil de usar, pero a nivel de ofertas de trabajo se encuentra muy, muy por detrás de los otros dos.

En caso de que queráis trabajar con Angular o React, sería bueno plantearse el desarrollo de una API Rest para la comunicación entre el Front-end y el Back-end

Un aspecto que es imprescindible hoy en día es que vuestro proyecto o cualquier página web que realicéis ha de ser **responsive**, es decir, su contenido debe adaptarse al dispositivo en el que se está mostrando, de modo que, siempre se pueda visualizar correctamente su contenido. Esto es tan importante que hasta Google penaliza las páginas que no son responsive a la hora de posicionarlas en los resultados de búsqueda. Esto se puede lograr de muchas maneras diferentes, uno de los elementos principales son las _Media Queries_ que consiste en definir unas reglas que cuando se cumplan el navegador aplicará el CSS relacionado con esa media query. Existen un gran número de frameworks creados creados para facilitarnos la creación de un sitio responsive y moderno. Aquí os dejo algunos de ellos:

- [Bootstrap Enlaces a un sitio externo.](https://getbootstrap.com/),
- [Pure.CSS Enlaces a un sitio externo.](https://purecss.io/),
- [Unsemantic Enlaces a un sitio externo.](https://unsemantic.com/),
- [Skeleton Enlaces a un sitio externo.](http://getskeleton.com/),
- [Materialize Enlaces a un sitio externo.](https://materializecss.com/),
- [Responsive Enlaces a un sitio externo.](https://responsivebp.com/).

Por último, como ya os he comentado antes, el mundo del desarrollo web está evolucionando y cobrando mucha importancia y por suerte se decidió hacer las cosas bien hechas y definir unos estándares a seguir, cosa que años atrás no existía, ya que cada navegador implementaba sus propias funcionalidades y diferentes maneras de interpretar el DOM y el código JavaScript, lo que obligaba a los desarrolladores a tener partes de su código adaptado a cada uno de los diferentes navegadores, aquí es donde la aparición de jQuery fue tan importante, ya que permitía desarrollar un solo código y olvidarse por completo en que navegador se ejecutaría, esta librería decidía internamente como ejecutar el código para realizar las tareas deseadas según el navegador en el que se estuviese ejecutando. Disculpad el rollo que os he soltado, todo esto era para hablaros de los **_Web Components_**, que son un conjunto de características añadidas por la W3C a HTML y al DOM que nos permiten crear widgets y componentes reutilizables en nuestras páginas webs y como han sido definidas por el W3C, forman parte de esta estandarización, y son compatibles con la mayoría de navegadores modernos, por lo tanto, si lo deseáis podéis investigar un poco sobre estos y ver si deseáis utilizarlo.

## Testing:

Cuando se desarrollan aplicaciones de escritorio o aplicaciones web, es una buena práctica la creación de test para asegurar que todo funciona correctamente a medida que la aplicación va creciendo e implementando nuevas funcionalidades. Si estáis interesados en realizar testing a vuestras aplicaciones, podéis utilizar los sistemas siguientes para los lenguajes que os he comentado anteriormente:

- **PHP:** PHPUnit, Codeception, PHPSpec.
- **Python:** PyTest o Nose.
- **Java:** Junit, Mockito, TestingNG.
- **Node.js:** Jest, Mocha, Jasmine o Chai.
- **Ruby:** Capybara o RSpec.
- **GoLang:** existe un paquete “testing” para GoLang.

## Aplicaciones híbridas:

En los últimos años JavaScript ha ido evolucionando de manera espectacular y por su potencial, sencillez de uso y junto con las nuevas posibilidades que ofrece HTML5 han hecho que muchas empresas y desarrolladores hayan decidido desarrollar sus aplicaciones móviles y de escritorio utilizando estas tecnologías de desarrollo web. En otra palabras, vosotros podéis crear una aplicación web y convertirla en una aplicación de escritorio o una aplicación para un dispositivo móvil. Algunas herramientas que nos permiten hacer esto son:

- [Electron Enlaces a un sitio externo.](https://electronjs.org/),
- [Ionic Enlaces a un sitio externo.](https://ionicframework.com/),
- [NativeScript Enlaces a un sitio externo.](https://www.nativescript.org/),
- [React Native Enlaces a un sitio externo.](https://facebook.github.io/react-native/).

## IDEs y Editores de texto para realizar el desarrollo:

Un IDE es el programa que se utiliza para escribir el código de vuestra aplicación y en la mayoría de ocasiones la pregunta que más soléis hacer cuando vais a empezar a desarrollar vuestro TFG o una página web es: ¿Qué programa utilizo? Muchas veces pensáis en programas de pago como podría ser Dreamweaver de Adobe, pero en la mayoría de casos no disponemos de la licencia para usarlo. Por el contrario, al ser alumnos de la UOC sí que podéis utilizar de manera gratuita todos los programas de [JetBrains Enlaces a un sitio externo.](https://www.jetbrains.com/). JetBrains os ofrece múltiples IDEs que os pueden ser de utilidad para realizar vuestros desarrollos para el TFG:

- PHP: [PHPStorm Enlaces a un sitio externo.](https://www.jetbrains.com/phpstorm/?fromMenu)
- Python: [PyCharm Enlaces a un sitio externo.](https://www.jetbrains.com/pycharm/?fromMenu)
- Java: [IntelliJ IDEA Enlaces a un sitio externo.](https://www.jetbrains.com/idea/?fromMenu)
- JavaScript: [WebStrom Enlaces a un sitio externo.](https://www.jetbrains.com/webstorm/?fromMenu)
- Ruby and Rails: [RubyMine Enlaces a un sitio externo.](https://www.jetbrains.com/ruby/?fromMenu)
- GoLang: [Go Productive Enlaces a un sitio externo.](https://www.jetbrains.com/go/?fromMenu)
- .NET: [Rider Enlaces a un sitio externo.](https://www.jetbrains.com/rider/?fromMenu)

\*Como punto adicional: en vuestro TFG casi seguro que vais a necesitar utilizar una base de datos, para ello JetBrains tiene un programa para administrar bases de datos que se llama [DataGrip Enlaces a un sitio externo.](https://www.jetbrains.com/datagrip/?fromMenu). Si no recuerdo mal, este programa no admite bases de datos NoSQL.

Si os gusta más utilizar software gratuito o libre o ninguna de las aplicaciones de JetBrains se ajusta a vuestras necesidades, existen IDEs muy buenos y muy usados en los entornos profesionales, muchos de ellos os permitirán crear proyectos para múltiples lenguajes de programación o tienen múltiples versiones, centradas cada una en un lenguaje concreto. Algunos de ellos son:

- [Visual Studio Code Enlaces a un sitio externo.](https://code.visualstudio.com/)
- [NetBeans Enlaces a un sitio externo.](https://netbeans.org/)
- [Eclipse Enlaces a un sitio externo.](https://www.eclipse.org/)
- [Sublime Text Enlaces a un sitio externo.](https://www.sublimetext.com/) (es de pago, pero su versión de prueba es plenamente funcional y sin fecha de caducidad)
- [Notepad ++ Enlaces a un sitio externo.](https://notepad-plus-plus.org/)
- [CodeLite Enlaces a un sitio externo.](https://codelite.org/)
- [Atom Enlaces a un sitio externo.](https://atom.io/)
- [Komodo Edit Enlaces a un sitio externo.](https://www.activestate.com/products/komodo-edit/)
- [RJ TextEd Enlaces a un sitio externo.](https://www.rj-texted.se/index.html)

En principio eso es todo. Si creéis que me he dejado alguna cosa o alguna información adicional que os podría ser de ayuda, no dudéis en comunicármelo y si puedo añadiré esa información.

Nos vemos,  
Jordi.
