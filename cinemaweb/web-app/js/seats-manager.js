jQuery(document).ready(function($) {

	//funcion para ocultar el formulario
	function hideForm(){
		$("#seats-form").css('display', 'none');
		$("#actions-start").css('display','block');
	}

	//funcion para mostrar el formulario
	function showForm(){
		$("#seats-form").css('display', 'block');
		$("#actions-start").css('display','none');
	}


	//boton para iniciar la creacion de nuevos asientos
	$("#add-start").click(function(event) {
		event.preventDefault();
		//a todos los que se pueden agregar les pongo clase seleccionable
		$(".toAdd").addClass('selectable');
		//muestro el formulario
		showForm();
		loadSelectableMethod();
	});


	//boton para iniciar la funcion de remover  de nuevos asientos
	$("#remove-start").click(function(event) {
		event.preventDefault();
		//a todos los que se pueden agregar les pongo clase seleccionable
		$(".toDelete").addClass('selectable');
		//muestro el formulario
		showForm();
		loadSelectableMethod();
	});


	//cancela las acciones y muestra otra vez los botones de accion
	$("#action-cancel").click(function(event) {
		event.preventDefault();
		//saco la clase seleccionable a todos y el atributo "selected"
		$(".selectable").unbind('click');
		$(".selectable").removeClass('selectable');
		$("[data-selected='1']").removeAttr('data-selected');
		$(".toAdd").css('background-color', 'white');
		$(".toDelete").css('background-color', '#9CB9F8');
		//remuevo todos los imputs del formulario
		$(".seats-toupdate").remove();
		hideForm();
	});


	$('#action-save').click(function(event) {
		event.preventDefault();
		$('div#seats-form > form').submit();
	});


	/**
	 *
	 * Funciones para la celda de la tabla
	 *
	 */

	 //remueve el input oculto de la celda
	 function removeFromForm(fila,columna){
	 	var toRemove = fila + "," + columna
	 	$("input.seats-toupdate[value='" + toRemove + "'").remove();
	 }


	 //agrega la celda como input oculto
	 function addToForm(fila, columna, action){
	 	var currentValue = fila + "," + columna
	 	//si la accion es add son asientos para agregar, sino son para remover
	 	var updateSet = "";
	 	if (action == "add") {
	 		updateSet = "toAdd";
	 	}else{
	 		updateSet = "toRemove";
	 	}

	 	var newInputSeat = "<input type='hidden' class='seats-toupdate' name='" + updateSet + "' value='" + currentValue + "'/>";

	 	//agrego al formulario el input 
	 	$("div#seats-form > form").append(newInputSeat);
	 }



	 function loadSelectableMethod(){
	 	$(".selectable").click(function(event) {
	 		event.preventDefault();
		//chequeo si esta seleccionando o des-seleccionando
		if($(this).attr('data-selected') == 1){
			//saco la entrada en el formumario
			removeFromForm($(this).attr('data-fila'),$(this).attr('data-columna'));
			//lo des-selecciono
			$(this).attr('data-selected', 0);
			//saco el color de la celda y pongo el que corresponde
			var cellColor = ($(this).hasClass('toAdd')) ? "white" : "#9CB9F8";
			$(this).css('background-color', cellColor);
		}else{
			//chequeo si se quiere borrar o agregar la celda
			if($(this).hasClass('toAdd')){
				var action = "add";
			}else{
				var action = "remove";
			}
			//agrego la entrada en el formulario
			addToForm($(this).attr('data-fila'),$(this).attr('data-columna'),action);
			//selecciono la celda
			$(this).attr('data-selected', 1);
			//pongo el color de la celda
			$(this).css('background-color', '#93D1B8');
		}
		});
	 }

	});
