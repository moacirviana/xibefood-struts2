package br.jus.xibefood.util;

import java.lang.reflect.Field;
import java.util.List;

public class ReflectionUtil {

	@SuppressWarnings("rawtypes")
	/**
	 * Imprime todos os campos e seus valores via java reflection
	 * 
	 * @param valueObj - objeto a ser impresso, independente de qual classe seja
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	public static void imprimirObjeto(final Object objeto) throws IllegalArgumentException, IllegalAccessException {
		String data = "";
		Class c1 = objeto.getClass();
		data = data + c1.getSimpleName() + "-------------------------------------------\n";

		Field[] valueObjFields = c1.getDeclaredFields();

		for (int i = 0; i < valueObjFields.length; i++) {
			valueObjFields[i].setAccessible(true);
			Object newObj = valueObjFields[i].get(objeto);

			data = data + valueObjFields[i].getName() + ":" + newObj + "\t| ";

		}
		System.out.println(data);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static void imprimirLista(final Object lista) throws IllegalArgumentException, IllegalAccessException {
		String data = "";

		List<Object> lst = (List<Object>) lista;
		
		if(lst.isEmpty()) {
			data = "lista vazia";
		} else {
			Class c1 = lst.get(0).getClass();
			
			data = data + c1.getSimpleName() + "\n-------------------------------------------\n";

			for (Object obj : lst) {
				Class c2 = obj.getClass();
				Field[] valueObjFields = c2.getDeclaredFields();

				for (int i = 0; i < valueObjFields.length; i++) {
					valueObjFields[i].setAccessible(true);
					Object newObj = valueObjFields[i].get(obj);

					data = data + valueObjFields[i].getName() + ":" + newObj + "\t| ";

				}
				data = data + "\n";
			}
			System.out.println(data);
		}

	}

}
