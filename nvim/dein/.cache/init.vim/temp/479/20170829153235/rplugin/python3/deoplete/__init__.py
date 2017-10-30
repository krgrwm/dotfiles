# ============================================================================
# FILE: __init__.py
# AUTHOR: Shougo Matsushita <Shougo.Matsu at gmail.com>
# License: MIT license
# ============================================================================
import neovim

from deoplete import logger
from deoplete.deoplete import Deoplete


@neovim.plugin
class DeopleteHandlers(object):

    def __init__(self, vim):
        self._vim = vim

    @neovim.function('_deoplete', sync=False)
    def init_channel(self, args):
        self._deoplete = Deoplete(self._vim)
        self._vim.vars['deoplete#_channel_id'] = self._vim.channel_id

    @neovim.rpc_export('deoplete_enable_logging')
    def enable_logging(self, level, logfile):
        logger.setup(self._vim, level, logfile)
        self._deoplete.debug_enabled = True

    @neovim.rpc_export('deoplete_auto_completion_begin')
    def completion_begin(self, context):
        context['rpc'] = 'deoplete_auto_completion_begin'
        self._deoplete.completion_begin(context)

    @neovim.rpc_export('deoplete_manual_completion_begin')
    def manual_completion_begin(self, context):
        context['rpc'] = 'deoplete_manual_completion_begin'
        self._deoplete.completion_begin(context)

    @neovim.rpc_export('deoplete_on_event')
    def on_event(self, context):
        context['rpc'] = 'deoplete_on_event'
        self._deoplete.on_event(context)
