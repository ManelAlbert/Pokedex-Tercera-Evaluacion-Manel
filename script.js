$(document).ready(function() {
    $('#formulario-busqueda').on('submit', function(e) {
        e.preventDefault();

        let nombre = $('#nombre').val();
        let generacion = $('#generacion').val();
        let tipo = $('#tipo').val();
        let habilidad = $('#habilidad').val(); // Añade esta línea si tienes un input/select con id="habilidad"

        $.ajax({
            url: 'buscar.php',
            type: 'POST',
            dataType: 'json',
            data: {
                nombre: nombre,
                generacion: generacion,
                tipo: tipo,
                habilidad: habilidad // Añade esto para enviar la habilidad
            },
            success: function(respuesta) {
                console.log('Respuesta AJAX:', respuesta);
                mostrarResultados(respuesta);
            },
            error: function(xhr, status, error) {
                console.error('Error en la petición AJAX:', error);
            }
        });
    });

    function mostrarResultados(pokemonList) {
        $('#resultados').empty();

        if (pokemonList.length === 0) {
            $('#resultados').append('<p>No se ha encontrado ningún Pokémon con esos criterios.</p>');
        } else {
            pokemonList.forEach(function(pokemon) {
                let tipo2 = pokemon.type2 ? ` / ${pokemon.type2}` : '';
                let habilidad = pokemon.habilidad ? `<div class="habilidad"><b>Habilidad:</b> ${pokemon.habilidad}</div>` : '';
                let card = `
                    <div class="pokemon">
                        <img src="${pokemon.sprite_url}" alt="${pokemon.name}">
                        <h3>#${pokemon.numero_pokedex} ${pokemon.name}</h3>
                        <p>${pokemon.type1}${tipo2}</p>
                        ${habilidad}
                    </div>
                `;
                $('#resultados').append(card);
            });
        }
    }
});
