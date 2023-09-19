// Me desenhando :)
draw_self();

// Se eu posso mostrar o meu estado atual.
if (showState)
{
	// Setando a posição horizontal do meu texto. Alinhado no centro.
	draw_set_halign(1);
	// Setando a posição vertical do meu texto. Alinhado no meio.
	draw_set_valign(1);
	// Denhando o meu texto/nome do estado.
	draw_text_transformed(x,y-sprite_height/2-12,stateName,0.5,0.5,0);
	// Resetando o alinhamento horizontal para os valores padrões.
	draw_set_halign(-1);
	// Resetando o alinhamento vertical para os valores padrões.
	draw_set_valign(-1);
}