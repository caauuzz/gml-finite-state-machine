// Atualizando o State Machine. Sem essa função rodando, nada acontecerá.
UpdateState();

// Verificando se o meu mouse está por cima do player. Apenas para Debug.
if (position_meeting(mouse_x,mouse_y,self))
{
	// Se o meu mouse estiver em cima do player, checar se eu apertei o botão esquerdo do mouse
	// para mostrar ou não o meu estado atual.
	if (mouse_check_button_pressed(mb_left))
	{
		// Mostrando ou não o meu estado atual.
		showState = !showState;
	}
}

