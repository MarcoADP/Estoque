package loja

class Usuario implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	String nome
	String cpf
	String cargo
	Date dateCreated

	Usuario(String username, String password, String nome, String cpf, String cargo) {
		this()
		this.username = username
		this.password = password
		this.nome = nome
	}

	@Override
	int hashCode() {
		username?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof Usuario && other.username == username)
	}

	@Override
	String toString() {
		nome
	}

	Set<Papel> getAuthorities() {
		UsuarioPapel.findAllByUsuario(this)*.papel
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false, password: true
		nome blank: false
		cpf cpf: true, unique: true
		cargo inList: ["Funcionario", "Gerente"]
	}

	static mapping = {
		password column: '`password`'
		dateCreated column: 'data_criacao'
	}
}
