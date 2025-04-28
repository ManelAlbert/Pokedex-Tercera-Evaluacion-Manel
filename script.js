$(document).ready(function() {
    $('#formulario-busqueda').on('submit', function(e) {
        e.preventDefault();

        let nombre = $('#nombre').val();
        let generacion = $('#generacion').val();

        $.ajax({
            url: 'buscar.php',
            type: 'POST',
            dataType: 'json',
            data: {
                nombre: nombre,
                generacion: generacion
            },
            success: function(respuesta) {
                console.log('Respuesta AJAX:', respuesta); // 👈 VERIFICACIÓN AÑADIDA AQUÍ
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
                let card = `
                    <div class="pokemon">
                        <img src="${pokemon.sprite_url}" alt="${pokemon.name}">
                        <h3>${pokemon.name}</h3>
                        <p>${pokemon.type1}${tipo2}</p>
                    </div>
                `;
                $('#resultados').append(card);
            });
        }
    }
});
