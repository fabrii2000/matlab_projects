classdef Persona
    %PERSONA Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = private)
        nome 
        cognome
    end
    
    methods
        function obj = Persona(nome, cognome)
            obj.nome = nome;
            obj.cognome = cognome;
        end
        function name = getName(obj)
            name = obj.nome;
        end
    end
end

