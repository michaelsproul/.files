#!/usr/bin/env python3

import os

EXCLUDE = {"deploy.py", "Readme.md"}

def deploy(src=".", dest="~", overwrite=False):
	src = os.path.abspath(os.path.expanduser(src))
	dest = os.path.abspath(os.path.expanduser(dest))

	for file in os.listdir(src):
		# Skip excluded and dot files
		if file in EXCLUDE or file[0] == '.':
			continue

		# Spell out full paths for the link and target
		target_file = os.path.join(src, file)
		link_file = os.path.join(dest, ".%s" % file)

		# Create a symlink if there's room
		if delete(link_file, overwrite=overwrite):
			symlink(target_file, link_file)
		else:
			print("No link created for %s" % file)


def delete(path, overwrite=False):
	"""Attempt to delete the file or folder specified by `path`.

	If `overwrite` is False, confirmation will be sought before deleting.
	This function returns True if the path is successfully cleared.
	"""
	# Symbolic link deletion
	if os.path.islink(path):
		if overwrite:
			os.remove(path)
			return True

		choice = input("Remove symbolic link %s? [y/N] " % path)
		if choice.lower() in "no":
			return False
		else:
			os.remove(path)
			return True

	# File deletion
	if os.path.isfile(path):
		if overwrite:
			os.remove(path)
			return True

		choice = input("Remove regular file %s? [y/N] " % path)
		if choice.lower() in "no":
			return False
		else:
			os.remove(path)
			return True

	# Directory deletion
	if os.path.isdir(path):
		if overwrite:
			os.removedirs(path)
			return True

		choice = input("Remove ENTIRE DIRECTORY %s? [y/N] " % path)
		if choice.lower() in "no":
			return False
		else:
			os.removedirs(path)
			return True

	# Nothing to delete
	return True


def symlink(target_file, link_file):
	print("Symlinking %s -> %s" % (link_file, target_file))
	os.symlink(target_file, link_file)

if __name__ == "__main__":
	deploy()
