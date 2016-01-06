package es.fdi.iw.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import es.fdi.iw.ContextInitializer;
import es.fdi.iw.model.Bestia;
import es.fdi.iw.model.Heroe;
import es.fdi.iw.model.Item;
import es.fdi.iw.model.TipoItem;
import es.fdi.iw.model.User;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {


	@PersistenceContext
	private EntityManager entityManager;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		/*logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );*/

		return "login";
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/perfil", method = RequestMethod.GET)
	public String perfil(Model model , HttpSession session) {
		String formSource = "perfil";
		User u = (User)session.getAttribute("user");
		if(u == null) formSource = "login";
		return formSource;
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/arcade", method = RequestMethod.GET)
	public String arcade(Locale locale, Model model , HttpSession session) {
		String formSource = "arcade";
		User u = (User)session.getAttribute("user");
		if(u == null) formSource = "login";
		List<Bestia> b = null;
		try{
			b = (List<Bestia>)entityManager.createNamedQuery("bestiasPorNivel").getResultList();
			model.addAttribute("bestias", b);
		} catch(NoResultException nre){}
		return formSource;
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/arena", method = RequestMethod.GET)
	public String arena(Locale locale, Model model , HttpSession session) {
		String formSource = "combates";
		User u = (User)session.getAttribute("user");
		if(u == null) formSource = "login";
		Bestia rival=(Bestia)entityManager.createNamedQuery("bestiaByName").setParameter("nombreParam", "boqueron").getSingleResult();;
		model.addAttribute("rival", rival);
		return formSource;
	}

	@RequestMapping(value = "/escoge", method = RequestMethod.POST)
	public void escoge(String nombre,Locale locale, Model model) {

		Bestia rival=(Bestia)entityManager.createNamedQuery("bestiaByName").setParameter("nombreParam", nombre).getSingleResult();;
		model.addAttribute("rival", rival);
		System.err.println(nombre+"s");

	}


	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {

		return "login";
	}

	/*******************************************************************************/

	/**************************** ARMERIA ******************************/

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/armeria", method = RequestMethod.GET)
	public String armeria(Model model , HttpSession session) {
		String formSource = "armeria";
		User u = (User)session.getAttribute("user");
		if(u == null) formSource = "login";
		List<Item> i = null;
		try{
			i = (List<Item>)entityManager.createNamedQuery("itemsPorPrecio").getResultList();
			model.addAttribute("items", i);
		} catch(NoResultException nre){}
		return formSource;
	}

	@Transactional
	@RequestMapping(value = "/comprarObjeto", method = RequestMethod.POST)
	public String comprarObjeto(
			@RequestParam("idObjeto") long id,
			Model model,HttpSession session) {
		String formSource = "armeria";
		try{
			Item i = (Item)entityManager.getReference(Item.class, id);
			User u = (User)session.getAttribute("user");
			u.getHeroe().comprarObjeto(i);
			//entityManager.refresh(u.getHeroe());
			session.removeAttribute("user");
			session.setAttribute("user", u);
		} catch(NoResultException nre){}
		return armeria(model,session);
	}

	@Transactional
	@RequestMapping(value = "/venderObjeto", method = RequestMethod.POST)
	public String venderObjeto(
			@RequestParam("idObjeto") long id,
			Model model,HttpSession session) {
		String formSource = "armeria";
		try{
			Item i = (Item)entityManager.getReference(Item.class, id);
			User u = (User)session.getAttribute("user");
			u.getHeroe().venderObjeto(i);
			//entityManager.refresh(u.getHeroe());
			session.removeAttribute("user");
			session.setAttribute("user", u);
		} catch(NoResultException nre){}
		return armeria(model,session);
	}

	/*******************************************************************************/

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/lobby", method = RequestMethod.GET)
	public String lobby(Locale locale, Model model , HttpSession session) {
		String formSource = "lobby";
		User u = (User)session.getAttribute("user");
		if(u == null) formSource = "login";
		return formSource;
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/registrar", method = RequestMethod.GET)
	public String registrar(Locale locale, Model model) {
		return "registrar";
	}

	/**
	 * Intercepts login requests generated by the header; then continues to load normal page
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@Transactional
	public String login(
			@RequestParam("login") String formLogin,
			@RequestParam("password") String formPass,
			HttpServletRequest request, HttpServletResponse response, 
			Model model, HttpSession session) {


		String formSource = "login";
		logger.info("Login attempt from '{}' while visiting '{}'", formLogin);

		// validate request
		if (formLogin == null || formLogin.length() < 4 || formPass == null || formPass.length() < 4) {
			model.addAttribute("loginError", "usuarios y contraseñas: 4 caracteres mínimo");
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		} else {
			User u = null;
			try {
				u = (User)entityManager.createNamedQuery("userByLogin")
						.setParameter("loginParam", formLogin).getSingleResult();
				if (u.isPassValid(formPass)) {
					// sets the anti-csrf token
					getTokenForSession(session);
					logger.info("pass was valid");				
					session.setAttribute("user", u);
					if(u.getRole().equals("user"))
						formSource = "perfil";
					else if(u.getRole().equals("admin")){
						return gestionUsuarios(model, session);
					}
				} else {
					logger.info("pass was NOT valid");
					model.addAttribute("loginError", "error en usuario o contraseña");
					response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
				}
			} catch (NoResultException nre) {
				logger.info("no such login: {}", formLogin);
				model.addAttribute("loginError", "error en usuario o contraseña");
			}
		}

		// redirects to view from which login was requested
		return formSource;
	}

	/**
	 * Intercepts login requests generated by the header; then continues to load normal page
	 */
	@RequestMapping(value = "/registro", method = RequestMethod.POST)
	@Transactional
	public String registro(
			@RequestParam("correo") String formLogin,
			@RequestParam("nombre") String formNombre,
			@RequestParam("password") String formPass,
			@RequestParam("repassword") String formRePass,
			@RequestParam("imagen") String formImagen,

			HttpServletRequest request, HttpServletResponse response, 
			Model model, HttpSession session) {

		logger.info("Login attempt from '{}' while visiting '{}'", formLogin);
		String formSource = "registrar";
		// validate request
		if (formLogin == null || formLogin.length() < 4 || formPass == null || formPass.length() < 4) {
			model.addAttribute("registrerError", "usuarios y contraseñas: 4 caracteres mínimo");
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		} else {
			User user = User.createUser(formLogin, formPass, "admin", formNombre);
			User u = null;
			try{
				u = (User)entityManager.createNamedQuery("userByLogin")
						.setParameter("loginParam", formLogin).getSingleResult();
				if (u != null) {
					model.addAttribute("registrerError", "ya estas registrado");
				} else {
					if(formPass.equals(formRePass)){
						user.getHeroe().setImagen(formImagen);
						entityManager.persist(user.getHeroe());
						entityManager.persist(user);	
						session.setAttribute("user", user);
						formSource = "perfil";
					} else {
						model.addAttribute("registrerError", "la contraseña no es la misma en los dos campos");
						formSource = "registrar";
					}
				}
			}catch(NoResultException nre){
				if(formPass.equals(formRePass)){
					user.getHeroe().setImagen(formImagen);
					entityManager.persist(user.getHeroe());
					entityManager.persist(user);				
					session.setAttribute("user", user);
					formSource = "perfil";
				} else {
					formSource = "registrar";
				}
			}
		}

		// redirects to view from which login was requested
		return formSource;
	}


	/**
	 * Logout (also returns to home view).
	 */
	@RequestMapping(value = "/logout", 
			method = RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("User '{}' logged out", 
				session.getAttribute("user"));
		session.invalidate();
		return "redirect:/";
	}

	/*********************** PERFIL ********************************/
	@Transactional
	@RequestMapping(value = "/subirStats", method = RequestMethod.POST)
	public String subirStats(
			@RequestParam("id") long id,
			@RequestParam("subir") String stat,
			HttpSession session,
			Model model) {
		User u = entityManager.getReference(User.class, id);
		Heroe h = u.getHeroe();
		boolean modificado = false;
		if (h.getPuntosHab() > 0) {
			if (stat.equals("subirVida") && (h.getVida() < Heroe.MAX_VIDA)) {
				double vida = h.getVida() + Heroe.VIDA_POR_PUNTO;
				h.setVida(vida);
				modificado = true;
			} else if (stat.equals("subirFue") && (h.getFuerza() < Heroe.MAX_FUERZA)) {
				int fuerza = h.getFuerza() + Heroe.FUE_POR_PUNTO;
				h.setFuerza(fuerza);
				modificado = true;
			} else if (stat.equals("subirPrec") && (h.getPrecision() < Heroe.MAX_PRECISION)) {
				int precision = h.getPrecision() + Heroe.PREC_POR_PUNTO;
				h.setPrecision(precision);
				modificado = true;
			} else if (stat.equals("subirDef") && (h.getDefensa() < Heroe.MAX_DEFENSA)) {
				int defensa = h.getDefensa() + Heroe.DEF_POR_PUNTO;
				h.setDefensa(defensa);
				modificado = true;
			} else if (h.getVelocidad() < Heroe.MAX_VELOCIDAD){
				int velocidad = h.getVelocidad() + Heroe.VEL_POR_PUNTO;
				h.setVelocidad(velocidad);
				modificado = true;
			}
			if (modificado) {
				h.setPuntosHab(h.getPuntosHab() - 1);
				entityManager.refresh(h);
				User aux = (User)session.getAttribute("user");
				aux.setHeroe(h);
				session.setAttribute("user", aux);
				//entityManager.flush();
			}
		}
		return "/perfil";
	}
	@Transactional
	@RequestMapping(value = "/equiparObjeto", method = RequestMethod.POST)
	public String equiparObjeto(
			@RequestParam("idObjeto") long id,
			Model model,HttpSession session) {
		String formSource = "perfil";
		try{
			Item i = (Item)entityManager.getReference(Item.class, id);
			User u = (User)session.getAttribute("user");
			u.getHeroe().equipar(i);
			//entityManager.refresh(u.getHeroe());
			session.removeAttribute("user");
			session.setAttribute("user", u);
		} catch(NoResultException nre){}
		return perfil(model,session);
	}

	/*
	 ********************* FUNCIONES DE LA GESTION *****************************
	 */

	/************************ GESTION DE USUARIOS *********************************/

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/gestionUsuarios", method = RequestMethod.GET)
	public String gestionUsuarios(Model model,HttpSession session) {
		String formSource = "gestionUsuarios";
		List<User> u = null;
		try{
			u = (List<User>)entityManager.createNamedQuery("allUsers").getResultList();
			model.addAttribute("users", u);
			if(!isAdmin(session)) formSource = "login";
		} catch(NoResultException nre){}
		return formSource;
	}

	@Transactional
	@RequestMapping(value = "/borrarUsuario", method = RequestMethod.POST)
	public String borrarUsuario(
			@RequestParam("idUsuario") long id,
			Model model,HttpSession session) {
		String formSource = "gestionBestias";
		User aux = (User)session.getAttribute("user");
		if(aux.getRole().equals("admin")){	
			try{
				User i = (User)entityManager.getReference(User.class, id);
				Heroe h = i.getHeroe();
				entityManager.remove(i);
				entityManager.remove(h);
			} catch(NoResultException nre){
			}
		}
		return gestionUsuarios(model,session);
	}

	@Transactional
	@RequestMapping(value = "/banearUsuario", method = RequestMethod.POST)
	public String banearUsuario(
			@RequestParam("idUsuario") long id,
			Model model,HttpSession session) {
		User aux = (User)session.getAttribute("user");
		if(aux.getRole().equals("admin")){	
			try{
				User i = (User)entityManager.getReference(User.class, id);
				if(i.isBanned()) i.setBanned(false);
					else i.setBanned(true);
				entityManager.persist(i);
			} catch(NoResultException nre){}
		}
		return gestionUsuarios(model,session);
	}
	
	@RequestMapping(value = "/nuevoAdmin", method = RequestMethod.GET)
	public String nuevoAdmin(Model model) {
		return "nuevoAdmin";
	}
	
	/**
	 * Intercepts login requests generated by the header; then continues to load normal page
	 */
	@RequestMapping(value = "/crearAdmin", method = RequestMethod.POST)
	@Transactional
	public String crearAdmin(
			@RequestParam("correo") String formLogin,
			@RequestParam("password") String formPass,
			@RequestParam("repassword") String formRePass,
			HttpSession session, Model model) {

		String formSource = "nuevoAdmin";
		// validate request
		if (formLogin == null || formLogin.length() < 4 || formPass == null || formPass.length() < 4) {
			model.addAttribute("registrerError", "correo y contraseñas: 4 caracteres mínimo");
		} else {
			User user = User.createUser(formLogin, formPass, "admin", null);
			User u = null;
			try{
				u = (User)entityManager.createNamedQuery("userByLogin")
						.setParameter("loginParam", formLogin).getSingleResult();
				if (u != null) {
					model.addAttribute("registrerError", "El administrador ya existe");
				} else {
					if(formPass.equals(formRePass)){
						entityManager.persist(user.getHeroe());
						entityManager.persist(user);	
						formSource = gestionUsuarios(model, session);
					} else {
						model.addAttribute("registrerError", "la contraseña no es la misma en los dos campos");
						formSource = "nuevoAdmin";
					}
				}
			}catch(NoResultException nre){
				if(formPass.equals(formRePass)){
					entityManager.persist(user.getHeroe());
					entityManager.persist(user);				
					formSource = gestionUsuarios(model, session);
				} else {
					formSource = "nuevoAdmin";
				}
			}
		}

		// redirects to view from which login was requested
		return formSource;
	}
	
	@RequestMapping(value = "/gestionUsuarios", method = RequestMethod.POST)
	public String buscarUsuario(Model model) {
		return "gestionUsuarios";
	}

	/*******************************************************************************/

	/**************************** GESTION OBJETOS *********************************/
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/gestionObjetos", method = RequestMethod.GET)
	public String gestionObjetos(Model model,HttpSession session) {
		String formSource = "gestionObjetos";
		List<Item> o = null;
		try{
			o = (List<Item>)entityManager.createNamedQuery("allItems").getResultList();
			model.addAttribute("objetos", o);
			if(!isAdmin(session)) formSource = "login";
		} catch(NoResultException nre){}
		return "gestionObjetos";
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/nuevoObjeto", method = RequestMethod.GET)
	public String nuevoObjeto(Model model) {
		if(model.containsAttribute("objeto")){
			//preguntar como borrar
		}
		return "nuevoObjeto";
	}

	@Transactional
	@RequestMapping(value = "/registrarItem", method = RequestMethod.POST)
	public String registrarItem(
			@RequestParam("idObj") long formid,
			@RequestParam("nombreObj") String formNombre,
			@RequestParam("tipoObj") TipoItem formTipo,
			@RequestParam("nivelObj") int formNivel,
			@RequestParam("vidaObj") double formVida,
			@RequestParam("fuerzaObj") int formFuerza,
			@RequestParam("precisionObj") int formPrecision,
			@RequestParam("defObj") int formDefensa,
			@RequestParam("velObj") int formVelocidad,
			@RequestParam("precioObj") int formPrecio,
			@RequestParam("photo") MultipartFile photo,
			Model model,HttpSession session) {
		//TipoItem tipo = TipoItem.parseo(formTipo);
		String formSource = "nuevoObjeto";
		// validate request
		if (formNombre == null) {
			model.addAttribute("objetoError", "Debe asignar un nombre");
		} else {
			Item aux = (Item)entityManager.getReference(Item.class, formid);
			entityManager.remove(aux);
			Item item = new Item(formNombre, formVida,formFuerza, formDefensa,
					formVelocidad, formPrecision, formTipo , formPrecio,formNivel);
			Item i = null;
			try{
				i = (Item)entityManager.createNamedQuery("itemByName")
						.setParameter("nombreParam", formNombre).getSingleResult();
				entityManager.persist(item);
				formSource = gestionObjetos(model,session);
				try{
					byte[] bytes = photo.getBytes();
					BufferedOutputStream stream =
							new BufferedOutputStream(
									new FileOutputStream(ContextInitializer.getFile("objeto", formNombre)));
					stream.write(bytes);
					stream.close();
				} catch (IOException e) {
					System.err.println("fallo");
				}
			} catch(NoResultException nre){
				entityManager.persist(item);				
				formSource = gestionObjetos(model,session);
				try{
					byte[] bytes = photo.getBytes();
					BufferedOutputStream stream =
							new BufferedOutputStream(
									new FileOutputStream(ContextInitializer.getFile("objeto", formNombre)));
					stream.write(bytes);
					stream.close();
				} catch (IOException e) {
					System.err.println("fallo");
				}
			}
		}
		return formSource;
	}

	@Transactional
	@RequestMapping(value = "/borrarObjeto", method = RequestMethod.POST)
	public String borrarObjeto(
			@RequestParam("idObjeto") long id,
			Model model,HttpSession session) {
		String formSource = "gestionObjetos";
		User aux = (User)session.getAttribute("user");
		if(aux.getRole().equals("admin")){	
			try{
				Item i = (Item)entityManager.getReference(Item.class, id);
				entityManager.flush();
				entityManager.remove(i);
				System.err.println("deberia borrar");
			} catch(NoResultException nre){
				System.err.println("basura");
			}
		}
		return gestionObjetos(model,session);
	}

	@Transactional
	@RequestMapping(value = "/modificarObjeto", method = RequestMethod.POST)
	public String modificarObjeto(
			@RequestParam("idObjeto") long id,
			Model model,HttpSession session) {
		User aux = (User)session.getAttribute("user");
		if(aux.getRole().equals("admin")){	
			try{
				Item i = (Item)entityManager.getReference(Item.class, id);
				model.addAttribute("objeto", i);
			} catch(NoResultException nre){
				System.err.println("basura");
			}
		}
		return nuevoObjeto(model);
	}

	@RequestMapping(value = "/nuevoObjeto", method = RequestMethod.POST)
	public String editarObjeto(Model model) {
		return "nuevoObjeto";
	}
	@ResponseBody
	@RequestMapping(value="/objeto/photo", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	public byte[] objetoPhoto(@RequestParam("nombre") String nombre) throws IOException {
		File f = ContextInitializer.getFile("objeto", nombre);
		InputStream in = null;
		if (f.exists()) {
			in = new BufferedInputStream(new FileInputStream(f));
		} else {
			in = new BufferedInputStream(
					this.getClass().getClassLoader().getResourceAsStream("unknown-user.jpg"));
		}

		return IOUtils.toByteArray(in);
	}

	/*******************************************************************************/

	/**************************** GESTION DE BESTIAS ******************************/
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/gestionBestias", method = RequestMethod.GET)
	public String gestionBestias(Model model , HttpSession session) {
		String formSource = "gestionBestias";
		List<Bestia> b = null;
		try{
			b = (List<Bestia>)entityManager.createNamedQuery("bestiasPorNivel").getResultList();
			model.addAttribute("bestias", b);
			if(!isAdmin(session)) formSource = "login";
		} catch(NoResultException nre){}
		return formSource;
	}

	@RequestMapping(value = "/nuevaBestia", method = RequestMethod.GET)
	public String nuevaBestia(Model model) {
		return "nuevaBestia";
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Transactional
	@RequestMapping(value = "/registrarBestia", method = RequestMethod.POST)
	public String registrarBestia(
			@RequestParam("nombreBestia") String formNombre,
			@RequestParam("nivel") int formNivel,
			@RequestParam("vida") int formVida,
			@RequestParam("fuerza") int formFuerza,
			@RequestParam("precision") int formPrecision,
			@RequestParam("defensa") int formDefensa,
			@RequestParam("velocidad") int formVelocidad,
			@RequestParam("exp") int formExp,
			@RequestParam("oro") int formOro,
			@RequestParam("photo") MultipartFile photo,
			Model model,HttpSession session) {

		String formSource = "nuevaBestia";

		// validate request
		if (formNombre == "") {
			model.addAttribute("bestiaError", "Debe asignar un nombre");
		} else {

			Bestia bestia = new Bestia(formFuerza, formDefensa, formVida, formPrecision
					,formVelocidad, formNivel, formNombre, formExp, formOro);
			Bestia b = null;

			try {
				b = (Bestia)entityManager.createNamedQuery("bestiaByName")
						.setParameter("nombreParam", formNombre).getSingleResult();
				if (b != null) {
					model.addAttribute("bestiaError", "el nombre ya esta en uso");
				} else {
					entityManager.persist(bestia);
					formSource = gestionBestias(model,session);
					try{
						byte[] bytes = photo.getBytes();
						BufferedOutputStream stream =
								new BufferedOutputStream(
										new FileOutputStream(ContextInitializer.getFile("bestia", formNombre)));
						stream.write(bytes);
						stream.close();
					} catch (IOException e) {
						System.err.println("fallo");
					}
				}
			} catch(NoResultException nre){
				entityManager.persist(bestia);				
				formSource = gestionBestias(model,session);
				try{
					byte[] bytes = photo.getBytes();
					BufferedOutputStream stream =
							new BufferedOutputStream(
									new FileOutputStream(ContextInitializer.getFile("bestia", formNombre)));
					stream.write(bytes);
					stream.close();
				} catch (IOException e) {
					System.err.println("fallo");
				}
			}
		}
		return formSource;
	}

	@Transactional
	@RequestMapping(value = "/borrarBestia", method = RequestMethod.POST)
	public String borrarBestia(
			@RequestParam("idBestia") long id,
			Model model,HttpSession session) {
		String formSource = "gestionBestias";
		User aux = (User)session.getAttribute("user");
		if(aux.getRole().equals("admin")){	
			try{
				Bestia i = (Bestia)entityManager.getReference(Bestia.class, id);
				entityManager.flush();
				entityManager.remove(i);
				System.err.println("deberia borrar");
			} catch(NoResultException nre){
				System.err.println("basura");
			}
		}
		return gestionBestias(model,session);
	}


	public String editarBestias() {
		return null;
	}

	@ResponseBody
	@RequestMapping(value="/bestia/photo", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	public byte[] bestiaPhoto(@RequestParam("nombre") String nombre) throws IOException {
		File f = ContextInitializer.getFile("bestia", nombre);
		InputStream in = null;
		if (f.exists()) {
			in = new BufferedInputStream(new FileInputStream(f));
		} else {
			in = new BufferedInputStream(
					this.getClass().getClassLoader().getResourceAsStream("unknown-user.jpg"));
		}

		return IOUtils.toByteArray(in);
	}

	/******************************************************************************/

	/** 
	 * Returns true if the user is logged in and is an admin
	 */
	static boolean isAdmin(HttpSession session) {
		User u = (User)session.getAttribute("user");
		if (u != null) {
			return u.getRole().equals("admin");
		} else {
			return false;
		}
	}

	/**
	 * Returns an anti-csrf token for a session, and stores it in the session
	 * @param session
	 * @return
	 */
	static String getTokenForSession (HttpSession session) {
		String token=UUID.randomUUID().toString();
		session.setAttribute("csrf_token", token);
		return token;
	}


	/**
	 * Checks the anti-csrf token for a session against a value
	 * @param session
	 * @param token
	 * @return the token
	 */
	static boolean isTokenValid(HttpSession session, String token) {
		Object t=session.getAttribute("csrf_token");
		return (t != null) && t.equals(token);
	}
}
