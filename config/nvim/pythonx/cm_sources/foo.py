# -*- coding: utf-8 -*-

from cm import register_source, Base, getLogger
register_source(name='foo_bar',
                    abbreviation='foo',
                    cm_refresh_patterns=[r'/'],
                    priority=8)

import re

logger = getLogger(__name__)

class Source(Base):

    def cm_refresh(self, info, ctx):
        matches = ['foo_bar','foo_baz']
        startcol = ctx['startcol']
        self.complete(info, ctx, startcol, matches)
