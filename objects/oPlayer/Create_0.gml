#region Variáveis Iniciais
// Debugando o nome do estado atual.
stateName = "";
// Verificando se posso ou não mostrar o nome do meu estado atual.
showState = true;

// Velocidade do player.
spd = 0;
#endregion

#region State Machine Controller

// Criando o estado de "Idle".
StateIdle = new StateMachine();
// Criando o Estado de "Walk".
StateWalk = new StateMachine();
// Criando um estado intermediário para mudar a escala do player.
StateChangeScale = new StateMachine();
// Criando um estado intermediário para resetar a escala original do player.
StateResetScale = new StateMachine();

#region STATE - IDLE
StateIdle.Init = function()
{
	// Iniciando o estado de "Idle", tudo que deve acontecer ao iniciar
	// o StateIdle, ficará aqui. Isso roda apenas em 1 frame.
	
	// Verificando qual estado o player está no momento. Apenas para debug.
	stateName = "Idle State";
	
	// sprite_index = sPlayer_idle;
	image_index = 0;
	image_blend = c_aqua;
	
	// Resetando a velocidade horizontal.
	hspeed = 0;
}

StateIdle.Update = function()
{
	// Atualizando o estado de "Idle", tudo que deve acontecer ao atualizar
	// o StateIdle, ficará aqui. Isso roda sempre, a todo frame.
	
	// Mudando o estado do player, quando eu apertar a barra de espaço.
	if (keyboard_check_pressed(vk_space))
	{
		// Mudando o estado através da função ChangeState, passando o novo estado do player.
		ChangeState(StateChangeScale);
	}
}
#endregion

#region STATE - WALK
StateWalk.Init = function()
{
	// Iniciando o estado de "Walk", tudo que deve acontecer ao iniciar
	// o StateWalk, ficará aqui. Isso roda apenas em 1 frame.
	
	// Verificando qual estado o player está no momento. Apenas para debug.
	stateName = "Walk State";
	
	// Selecionando a sprite do estado.
	// sprite_index = sPlayer_walk;
	
	// Resetando o image_index para 0, sempre que um novo estado iniciar.
	image_index = 0;
	
	// Mudando de cor, verificando se estou realmente mudando de estado. Apenas para debug.
	image_blend = c_red;
	
	// Selecionando a direção em que o player andará. Esquerda ou Direita.
	spd = choose(-1,1);
}

StateWalk.Update = function()
{
	// Atualizando o estado de "Walk", tudo que deve acontecer ao atualizar
	// o StateWalk, ficará aqui. Isso roda sempre, a todo frame.
	
	// Atualizando a velocidade do player a todo momento.
	hspeed = spd;
	
	// Trocando o estado.
	if (keyboard_check_pressed(vk_space))
	{
		// Indo para o estado "Reset Scale".
		ChangeState(StateResetScale);
	}
}
#endregion

#region STATE - CHANGE SCALE
StateChangeScale.Init = function()
{
	// Verificando qual estado o player está no momento. Apenas para debug.
	stateName = "Change Scale State";
	
	// Setando o image_blend do player para amarelo.
	image_blend = c_yellow;
}

StateChangeScale.Update = function()
{
	// Mudando o image_xscale do player.
	image_xscale = lerp(image_xscale,2,0.1);
	
	// Se for maior que 1.9, mudar de estado.
	if (image_xscale > 1.9)
	{
		// Mudando para o estado de "Walk".
		ChangeState(StateWalk);
	}
}
#endregion

#region STATE - RESET SCALE
StateResetScale.Init = function()
{
	// Verificando qual estado o player está no momento. Apenas para debug.
	stateName = "Reset Scale State";
	
	// Setando o image_blend do player para roxo. 
	image_blend = c_purple;
}

StateResetScale.Update = function()
{
	// Resetando o image_xscale do player.
	image_xscale = lerp(image_xscale, 1, 0.1);
	
	// Se for menor que 1.1, mudar o estado.
	if (image_xscale < 1.1)
	{
		// Indo para o estado de "Idle".
		ChangeState(StateIdle);
	}
}
#endregion

// Inciando o estado base.
InitState(StateIdle);

#endregion
