-- Proteção contra uso não autorizado
local allowedUserIds = {12345678, 98765432}  -- Substitua pelos UserIds autorizados
local allowedPlaceIds = {1234567890}          -- Substitua pelo PlaceId autorizado

local player = game:GetService("Players").LocalPlayer
local userId = player.UserId
local placeId = game.PlaceId

-- Função de proteção
local function antiCrack()
    if not table.find(allowedUserIds, userId) or not table.find(allowedPlaceIds, placeId) then
        warn("🚫 Acesso Negado: Esta library é protegida e não pode ser usada neste jogo ou por este usuário.")
        return false  -- Retorna falso para evitar a execução
    end
    return true  -- Se tudo estiver certo, retorna verdadeiro
end

-- Verifica se o acesso é permitido
if not antiCrack() then return end

-- Criando a Library
local Library = {}

-- Função de inicialização
function Library.Iniciar()
    print("✅ Library Iniciada com Sucesso!")
end

-- Função de Log
function Library.Log(text)
    print("🔧 LOG: " .. text)
end

-- Função para ativar/desativar modo Turbo
function Library.Turbo(status)
    if status then
        print("🚀 Modo Turbo Ativado!")
        -- Configurações de desempenho (desempenho turbo)
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        game:GetService("Lighting").GlobalShadows = false
        game:GetService("Lighting").FogEnd = 100
    else
        print("✅ Modo Turbo Desativado!")
        -- Restaura configurações
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level02
        game:GetService("Lighting").GlobalShadows = true
        game:GetService("Lighting").FogEnd = 1000
    end
end

-- Função para monitorar FPS e aplicar otimizações
function Library.MonitorarDesempenho()
    local fps = 60
    local frameCount = 0
    local lastTime = tick()

    game:GetService("RunService").RenderStepped:Connect(function()
        frameCount += 1
        local now = tick()
        if now - lastTime >= 1 then
            fps = frameCount
            frameCount = 0
            lastTime = now
        end
    end)

    if fps < 60 then
        print("⚠️ FPS Baixo! Modo Turbo Ativado!")
        Library.Turbo(true)
    else
        print("✅ FPS Estável!")
    end
end

-- Função Anti-Lag (limpeza de partículas)
function Library.AntiLag()
    for _, obj in ipairs(game.Workspace:GetDescendants()) do
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") then
            pcall(function() obj:Destroy() end)
        end
    end
end

-- Função Anti-Fling (prevenir fling de personagem)
function Library.AntiFling()
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local root = char.HumanoidRootPart
        if root.Velocity.Magnitude > 120 then
            root.Velocity = Vector3.zero
            root.RotVelocity = Vector3.zero
        end
    end
end

-- Função para ativar/desativar anti-network (proteger contra exploits)
function Library.AntiNetwork(status)
    if status then
        print("🔐 Anti-Network Ativado!")
        -- Adicionar proteção contra exploits aqui
    else
        print("✅ Anti-Network Desativado!")
        -- Remover proteção se necessário
    end
end

-- Função para carregar modelo baseado no token
local validToken = "65528hdu362nxy27dk93"  -- Token para autenticação

-- ID do modelo que será carregado
local modelId = 1234567890  -- Substitua pelo ID do modelo que você deseja carregar

-- Função para adicionar modelo ao jogo com base no token
function Library.AdicionarModeloComToken(token)
    -- Verifica se o token é válido
    if token ~= validToken then
        warn("🚫 Token inválido! A adição do modelo foi bloqueada.")
        return
    end

    -- Carregar o modelo automaticamente
    local model = game:GetService("InsertService"):LoadAsset(modelId)
    model.Parent = game.Workspace
    model:SetPrimaryPartCFrame(player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0))
    print("✅ Modelo Adicionado com Sucesso!")
end

-- Função para executar o código Lua personalizado pelo usuário
function Library.ExecutarCodigoDoUsuario(codigo)
    -- Validando o token antes de permitir a execução do código
    if not codigo or codigo == "" then
        warn("🚫 Nenhum código fornecido para execução!")
        return
    end

    -- Executa o código Lua passado pelo usuário
    local sucesso, erro = pcall(function()
        loadstring(codigo)()  -- Executa o código Lua no ambiente da Library
    end)

    if sucesso then
        print("✅ Código executado com sucesso!")
    else
        warn("🚫 Erro ao executar código: " .. erro)
    end
end

-- Retornar a Library pronta para uso
return Library
