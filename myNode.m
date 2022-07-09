% Define a class for creating node for Huffman Coding
% Intensity -> repetition of node
% Data -> coefficient or other value
% Code -> Huffman Coding
classdef myNode < handle
   properties
      Intensity
      Data
      Code
   end
   
   properties(SetAccess = private)
      Left = myNode.empty;
      Right = myNode.empty;
   end
   
   methods
       
      function node = myNode(Intensity, Data)
         if nargin > 0
            node.Intensity = Intensity;
            node.Data = Data;
            node.Code = '';
         end
      end
      
      function insertLeft(newNode, rootNode)
         rootNode.Left = newNode;
      end
      
      function insertRight(newNode, rootNode)
         rootNode.Right = newNode;
      end
      
      function setCode(code, node)
          node.Code = code;
      end
   end
   
end