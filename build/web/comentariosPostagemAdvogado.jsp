<%@page import="br.com.projetodefcon.model.Postagem"%>
<%@page import="br.com.projetodefcon.model.Comentario"%>
<%@page import="java.util.List"%>
<%@page import="br.com.projetodefcon.model.Pessoa"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Home - DEFCON</title>
  <meta name="author" content="Guilherme Grigolin">
  <meta name="description" content="advogados">
  <link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.4/dist/flowbite.min.css" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
    integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
  <link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" />

  <style>
    .bg-black-alt {
      background: #191919;
    }

    .text-black-alt {
      color: #191919;
    }

    .border-black-alt {
      border-color: #191919;
    }
  </style>

</head>

<body class="bg-black-alt font-sans leading-normal tracking-normal">
<% 
        HttpSession sessao = request.getSession(true);
        Pessoa pessoa = new Pessoa();
        pessoa = (Pessoa)sessao.getAttribute("sessaoP");
    
    %>
  <nav id="header" class="bg-gray-900 fixed w-full z-10 top-0 shadow">


    <div class="w-full container mx-auto flex flex-wrap items-center mt-0 pt-3 pb-3 md:pb-0">

      <div class="w-1/2 pl-2 md:pl-0">
        <a class="text-gray-100 text-base xl:text-xl no-underline hover:no-underline font-bold" href="#">
          <i class="fas fa-moon text-blue-400 pr-3"></i> DEFCON
        </a>
      </div>
      <div class="w-1/2 pr-0">
        <div class="flex relative inline-block float-right">
          <!-- PUXAR O NOME DO USUARIO AQUI EMBAIXO -->
          <div class="relative text-sm text-gray-100">
            <button id="userButton" class="flex items-center focus:outline-none mr-3">
              <span
                class="hidden md:inline-block text-gray-100">Ol� <%=pessoa.getNomePessoa()%></span>
              <svg class="pl-2 h-2 fill-current text-gray-100" version="1.1" xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 129 129" xmlns:xlink="http://www.w3.org/1999/xlink" enable-background="new 0 0 129 129">
                <g>
                  <path
                    d="m121.3,34.6c-1.6-1.6-4.2-1.6-5.8,0l-51,51.1-51.1-51.1c-1.6-1.6-4.2-1.6-5.8,0-1.6,1.6-1.6,4.2 0,5.8l53.9,53.9c0.8,0.8 1.8,1.2 2.9,1.2 1,0 2.1-0.4 2.9-1.2l53.9-53.9c1.7-1.6 1.7-4.2 0.1-5.8z" />
                </g>
              </svg>
            </button>
            <div id="userMenu"
              class="bg-gray-900 rounded shadow-md mt-2 absolute mt-12 top-0 right-0 min-w-full overflow-auto z-30 invisible">
              <ul class="list-reset">
                 <li><a href="CarregarAdvogado?idPessoa=<%=pessoa.getIdPessoa()%>"
                                        class="px-4 py-2 block text-gray-100 hover:bg-gray-800 no-underline hover:no-underline">Minha
                                        conta</a></li>
                
                <li>
                  <hr class="border-t mx-2 border-gray-400">
                </li>
                <li><a href="EncerraSessao"
                                        class="px-4 py-2 block text-gray-100 hover:bg-gray-800 no-underline hover:no-underline">Sair</a>
                                </li>
              </ul>
            </div>
          </div>


          <div class="block lg:hidden pr-4">
            <button id="nav-toggle"
              class="flex items-center px-3 py-2 border rounded text-gray-500 border-gray-600 hover:text-gray-100 hover:border-teal-500 appearance-none focus:outline-none">
              <svg class="fill-current h-3 w-3" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <title>Menu</title>
                <path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z" />
              </svg>
            </button>
          </div>
        </div>

      </div>


      <div class="w-full flex-grow lg:flex lg:items-center lg:w-auto hidden lg:block mt-2 lg:mt-0 bg-gray-900 z-20"
        id="nav-content">
        <ul class="list-reset lg:flex flex-1 items-center px-4 md:px-0">
          <li class="mr-6 my-2 md:my-0">
                        <a href="homeAdvogado.jsp"
                            class="block py-1 md:py-3 pl-1 align-middle text-blue-400 no-underline hover:text-gray-100 border-b-2 border-blue-400 hover:border-blue-400">
                            <i class="fas fa-home fa-fw mr-3 text-blue-400"></i><span
                                class="pb-1 md:pb-0 text-sm">Home</span>
                        </a>
                    </li>

                    <li class="mr-6 my-2 md:my-0">
                        <a href="ListarConsumidor"
                            class="block py-1 md:py-3 pl-1 align-middle text-gray-500 no-underline hover:text-gray-100 border-b-2 border-gray-900  hover:border-purple-400">
                            <i class="fa fa-envelope fa-fw mr-3"></i><span class="pb-1 md:pb-0 text-sm">Consumidores</span>
                        </a>
                    </li>
                    <li class="mr-6 my-2 md:my-0">
                        <a href="ListarPostagemAdvogado"
                            class="block py-1 md:py-3 pl-1 align-middle text-gray-500 no-underline hover:text-gray-100 border-b-2 border-gray-900  hover:border-green-400">
                            <i class="fas fa-chart-area fa-fw mr-3"></i><span
                                class="pb-1 md:pb-0 text-sm">Postagens</span>
                        </a>
                    </li>
          <!-- <li class="mr-6 my-2 md:my-0">
                        <a href="#"
                            class="block py-1 md:py-3 pl-1 align-middle text-gray-500 no-underline hover:text-gray-100 border-b-2 border-gray-900  hover:border-red-400">
                            <i class="fa fa-wallet fa-fw mr-3"></i><span class="pb-1 md:pb-0 text-sm">Payments</span>
                        </a>
                    </li> -->
        </ul>

        <div class="relative pull-right pl-4 pr-4 md:pr-0">
          <input type="search" placeholder="Procurar"
            class="w-full bg-gray-900 text-sm text-gray-400 transition border border-gray-800 focus:outline-none focus:border-gray-600 rounded py-1 px-2 pl-10 appearance-none leading-normal">
          <div class="absolute search-icon" style="top: 0.375rem;left: 1.75rem;">
            <svg class="fill-current pointer-events-none text-gray-500 w-4 h-4" xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 20 20">
              <path
                d="M12.9 14.32a8 8 0 1 1 1.41-1.41l5.35 5.33-1.42 1.42-5.33-5.34zM8 14A6 6 0 1 0 8 2a6 6 0 0 0 0 12z">
              </path>
            </svg>
          </div>
        </div>

      </div>

    </div>
  </nav>

  <!--Container-->
  <div class="container mx-auto">


    <section class="bg-gray-900 py-8 lg:py-16">
      <div class="max-w-2xl mx-auto px-4">
          <div class="flex justify-between items-center mt-10 mb-6">
          <h2 class="text-lg lg:text-2xl font-bold text-white"></h2>
        </div>
        <form name="cadastrar" action="CadastrarComentario" method="POST" class="mb-6">
            <%
                List<Postagem> postagens = (List<Postagem>) request.getAttribute("postagens");
                for (Postagem postagem : postagens) {
            %>
          <div class="py-2 px-4 mb-4  rounded-lg rounded-t-lg border  bg-gray-800 border-gray-700">
            <label for="comment" class="sr-only">comment</label>
            <textarea name="descricaoComentario" id="comment" rows="6"
              class="px-0 w-full text-sm  border-0 focus:ring-0 focus:outline-none text-white placeholder-gray-400 bg-gray-800"
              placeholder="Escreva um coment�rio..." required></textarea>
            <lable hidden=""><input type="text" name="idPostagem" hidden="" value=<%=postagem.getIdPostagem()%>></lable>
          </div>
          <button name="cadastrar" type="submit"
            class="inline-flex items-center py-2.5 px-4 text-xs font-medium text-center text-white bg-red-700 rounded-lg focus:ring-4 focus:ring-red-900 hover:bg-red-800">
            Postar coment�rio
          </button>
        </form>
          <%
            }
        %>
        <%
                List<Comentario> comentarios = (List<Comentario>) request.getAttribute("comentarios");
                for (Comentario comentario : comentarios) {
            %>
        <article class="p-6 mb-6 text-base rounded-lg bg-gray-900 border-solid border-2">
          <p class=" text-gray-400"><%=comentario.getDescricaoComentario()%></p>
          <div class="flex items-center mt-4 space-x-4">
          </div>
        </article>
          <%
            }
        %>
      </div>
    </section>
  </div>
  <script>

    /*Toggle dropdown list*/
    /*https://gist.github.com/slavapas/593e8e50cf4cc16ac972afcbad4f70c8*/

    var userMenuDiv = document.getElementById("userMenu");
    var userMenu = document.getElementById("userButton");

    var navMenuDiv = document.getElementById("nav-content");
    var navMenu = document.getElementById("nav-toggle");

    document.onclick = check;

    function check(e) {
      var target = (e && e.target) || (event && event.srcElement);

      //User Menu
      if (!checkParent(target, userMenuDiv)) {
        // click NOT on the menu
        if (checkParent(target, userMenu)) {
          // click on the link
          if (userMenuDiv.classList.contains("invisible")) {
            userMenuDiv.classList.remove("invisible");
          } else { userMenuDiv.classList.add("invisible"); }
        } else {
          // click both outside link and outside menu, hide menu
          userMenuDiv.classList.add("invisible");
        }
      }

      //Nav Menu
      if (!checkParent(target, navMenuDiv)) {
        // click NOT on the menu
        if (checkParent(target, navMenu)) {
          // click on the link
          if (navMenuDiv.classList.contains("hidden")) {
            navMenuDiv.classList.remove("hidden");
          } else { navMenuDiv.classList.add("hidden"); }
        } else {
          // click both outside link and outside menu, hide menu
          navMenuDiv.classList.add("hidden");
        }
      }

    }

    function checkParent(t, elm) {
      while (t.parentNode) {
        if (t == elm) { return true; }
        t = t.parentNode;
      }
      return false;
    }


  </script>
  <script src="https://unpkg.com/flowbite@1.5.4/dist/flowbite.js"></script>
</body>

</html>