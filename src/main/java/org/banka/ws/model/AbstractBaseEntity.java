package org.banka.ws.model;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Version;
import javax.validation.constraints.NotNull;

/**
 * Base entity class.
 * 
 */
@MappedSuperclass
public abstract class AbstractBaseEntity implements Serializable {

	/** serialVersionUID */
	private static final long serialVersionUID = 1L;

	/** Primary key. */
	private Long id;

	/** JPA version */
	@NotNull
	private Long version = 0L;

	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Version
	public Long getVersion() {
		return version;
	}

	public void setVersion(Long version) {
		this.version = version;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		AbstractBaseEntity other = (AbstractBaseEntity) obj;

		return null == this.getId() ? false : this.getId()
				.equals(other.getId());
	}

	@Override
	public String toString() {
		if (this.getId() != null) {
			// needed for Spring form JSP tags
			return this.getId().toString();
		}
		return super.toString();
	}

}
