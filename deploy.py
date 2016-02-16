#!/usr/bin/env python2

"""Dotfiles deploy script by Michael Sproul, 2015. GPLv3+"""

import os
import shutil

# Set of paths to exclude, relative to the current directory
EXCLUDE = {"deploy.py", "Readme.md", ".git", ".gitignore", ".gitmodules"}

# Set of directories which will be linked *as directories*
DIR_LINKS = {"bash", "nano", "vim/syntax", "vim/bundle"}

NO = ["n", "no"]
YES = ["y", "yes"]

def recursive_mirror(src_root, path, dest_root, add_dot=True):
	"""Mirror a single path relative to `src_root` onto `dest_root`.

	The "mirroring" is done via symbolic links.
	If `path` is the empty string, the whole directory is mirrored.
	If `add_dot` is true, a dot will be prepended to each filename
	in the root of the source directory. Dots are never added to
	filenames in lower directories.

	E.g.	~/.nanorc -> ~/.files/nanorc
			~/.config/menus/xfce.menu -> ~/.files/config/menus/xfce.menu
	"""
	if path in EXCLUDE:
		return

	# Avoid adding doubled dotted files like "..git"
	if add_dot and path != "" and path[0] == '.':
		print(">> You're about to make a file called .%s" % path)
		ans = input(">> Are you on crack? Continue? [y/N] ")
		if ans == "" or ans.lower() not in YES:
			return

	src = os.path.join(src_root, path)
	prefix = "." if add_dot else ""
	dest = os.path.join(dest_root, "%s%s" % (prefix, path))

	# Create symlinks for files and "linkable" directories
	if os.path.isfile(src) or path in DIR_LINKS:
		# Make room at the destination if neccessary
		if os.path.islink(dest):
			if os.readlink(dest) == src:
				print("%s is up to date." % dest)
			else:
				if delete(dest, "link"):
					symlink(src, dest)
				#else:
					#print("%s not linked." % src)
		elif os.path.isdir(dest):
			if delete(dest, "dir"):
				symlink(src, dest)
			#else:
				#print("%s not linked." % src)
		elif os.path.isfile(dest):
			if delete(dest, "file"):
				symlink(src, dest)
			#else:
				#print("%s not linked." % src)
		else:
			parent = os.path.dirname(dest)
			try:
				os.makedirs(parent)
			except OSError:
				pass
			symlink(src, dest)

	# Recurse on the contents of directories
	elif os.path.isdir(src):
		for p in os.listdir(src):
			new_path = os.path.join(path, p)
			recursive_mirror(src_root, new_path, dest_root, add_dot)
	else:
		print("What's going on?!")


def delete(path, type):
	if type == "dir":
		ans = input(">> Delete entire directory %s ? [y/N] " % path)
		if ans.lower() in NO:
			return False
		else:
			shutil.rmtree(path)
			return True
	else:
		ans = input(">> Delete existing %s, %s ? [y/N] " % (type, path))
		if ans.lower() in NO:
			return False
		else:
			os.remove(path)
			return True


def symlink(target, link):
	print("%s -> %s" % (link, target))
	os.symlink(target, link)


def deploy(src_root="~/.files", dest_root="~"):
	src_root = os.path.abspath(os.path.expanduser(src_root))
	dest_root = os.path.abspath(os.path.expanduser(dest_root))
	recursive_mirror(src_root, "", dest_root, True)


if __name__ == "__main__":
	deploy()

