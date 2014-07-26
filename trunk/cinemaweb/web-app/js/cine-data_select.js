function inicializarCines(cinesData, selectedCine, selectedSala){
		//cargo los cines
		$.each(cinesData, function(index, cine) {
			var newOption = $("<option/>").val(cine.id).html(cine.nombre); 
			if (cine.id == selectedCine){
				newOption.prop('selected', 'selected');
			};
			 newOption.appendTo('select#cine');
		});

		//cargo las salas del selecionado
		var currentCine = (selectedCine > 0) ? selectedCine : cinesData[0].id
		changeSalas(currentCine,cinesData,selectedSala);
	}

	function changeSalas(currentSalaID,cinesData, selectedSala){
		$("select#sala").empty()
		$.each(cinesData, function(index, cine){
			 if(cine.id == currentSalaID){
			 	//cargo las salas
			 	$.each(cine.salas, function(index, sala) {
			 		var newSalaOption = $("<option/>").val(sala.id).html(sala.nombre);
			 		if(sala.id == selectedSala){
			 			newSalaOption.prop("selected","selected");
			 		}

			 		newSalaOption.appendTo('select#sala');
			 	});
			 }
		});
	}