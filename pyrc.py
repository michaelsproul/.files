import os
import sys
import readline
import rlcompleter
import atexit

def enable_completion():
	completer = Completer()
	completer.enable_tab_completion()
	completer.enable_history()

sys.__interactivehook__ = enable_completion

class Completer(rlcompleter.Completer):
	def __init__(	self,
			indent="\t",
			completer_query_items=30,
			history_length=500):

		super().__init__()
		self.indent = indent
		self.completer_query_items = completer_query_items
		self.history_length = history_length

	def complete(self, text, state):
		if text == "" or text.isspace():
			readline.insert_text(self.indent)
			return None
		else:
			return super().complete(text, state)

	def enable_history(self):
		"""Enable history completion (stolen from site.py)"""
		try:
			readline.read_init_file()
		except:
			pass

		if readline.get_current_history_length() == 0:
			home = os.path.expanduser("~")
			history = os.path.join(home, ".python_history")

			try:
				readline.read_history_file(history)
			except:
				pass
			readline.set_history_length(self.history_length)
			atexit.register(readline.write_history_file, history)

	def enable_tab_completion(self):
		readline.parse_and_bind("tab: complete")
		readline.set_completer(self.complete)
		readline.parse_and_bind("set completion-query-items %d" % self.completer_query_items)
