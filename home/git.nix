{ pkgs, ...}:
{

programs.git = {
	enable = true;
	settings = {
		user = {
			name = "joseporcar";
			email = "joseaporcar@gmail.com";
		};
		init.defaultBranch = "main";
	};
};

}