package br.jus.xibefood.util;

import com.opensymphony.xwork2.validator.ValidationException;
import com.opensymphony.xwork2.validator.validators.FieldValidatorSupport;

public class ValidacaoData extends FieldValidatorSupport {

	public void validate(Object object) throws ValidationException {

		String fieldName = getFieldName();

		Object value = this.getFieldValue(fieldName, object);

         //System.out.println(" Objet "+value);

		if (value == null || value.toString() == "") {

			addFieldError(fieldName, object);

		}

	}

}