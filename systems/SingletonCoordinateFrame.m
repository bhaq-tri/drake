classdef SingletonCoordinateFrame < CoordinateFrame & Singleton
  
  methods
    function obj = SingletonCoordinateFrame(name,dim,prefix,coordinates)
      if nargin<3, prefix=''; end
      if nargin<4, coordinates={}; end

      obj = obj@CoordinateFrame(name,dim,prefix,coordinates);
      obj = obj@Singleton(name);  % will return an original object if it existed, over-writing the new CoordinateFrame

      if (obj.dim~=dim)
        error('Singleton coordinate frame already exists with that name, but a different dimension');
      end
      if (~isempty(prefix) && obj.prefix~=prefix)
        error('Singleton coordinate frame already exists with that name, but a different prefix');
      end
    end
  end
  
end