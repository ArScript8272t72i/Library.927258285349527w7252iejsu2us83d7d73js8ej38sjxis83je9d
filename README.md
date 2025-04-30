-- Carregar a Library do link fornecido
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArScript8272t72i/Library.927258285349527w7252iejsu2us83d7d73js8ej38sjxis83je9d/refs/heads/main/Libraryks83usjd83ins93jns93jsj93.lua"))()

-- Verificar se a Library foi carregada corretamente
if not Library then
    warn("🚫 Não foi possível carregar a Library.")
    return
end

-- Iniciar a Library
Library.Iniciar()

-- Função de exemplo para usar a Library
Library.Log("A Library foi carregada com sucesso!")

-- Exemplo de código Lua fornecido pelo usuário para ser executado na Library
local usuarioCodigo = [[
    -- Alterar o texto do console para algo personalizado
    game:GetService("Players").LocalPlayer.PlayerGui.DesempenhoConsole.Text = "🔥 Código do Usuário Executado com Sucesso!"
]]

-- Executar o código Lua fornecido pelo usuário
Library.ExecutarCodigoDoUsuario(usuarioCodigo)

-- Ativar/desativar funcionalidades, como Modo Turbo
Library.Turbo(true)  -- Ativar Modo Turbo
Library.AntiLag()    -- Ativar Anti-Lag

-- Adicionar Modelo usando Token
Library.AdicionarModeloComToken("65528hdu362nxy27dk93")  -- Usando o token fornecido
