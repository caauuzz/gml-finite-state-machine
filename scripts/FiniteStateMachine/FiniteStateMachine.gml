// Lógica principal do State Machine (Design Patern/Finite State Machine).
function StateMachine() constructor
{
	// Função estática de Inicialização.
	static Init = function() {};
	
	// Função estática de Atualização.
	static Update = function() {};
	
	// Função estática de Finalização.
	static Finish = function() {};
}

// Inicializando o estado atual do objeto.
function InitState(_state)
{
	// Pegando o estado atual e setando ele na variável de "_state".
	currentState = _state;
	// Inicializando esse estado.
	currentState.Init();
}

// Atualizando o estado atual do objeto.
function UpdateState()
{
	// Atualizando esse estado a todo momento/frame.
	currentState.Update();
}

// Função para troca de estados.
function ChangeState(_newState)
{
	// Finalizando o estado atual.
	currentState.Finish();
	
	// Indo para o novo estado
	currentState = _newState;
	
	// Inicializando o novo estado.
	currentState.Init();
}