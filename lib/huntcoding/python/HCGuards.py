from RestrictedPython.Guards import safe_builtins
from RestrictedPython.Guards import full_write_guard
from RestrictedPython.PrintCollector import PrintCollector

valid_inplace_types = list, set
inplace_slots = {
    '+=': '__iadd__',
    '-=': '__isub__',
    '*=': '__imul__',
    '/=': (1/2 == 0) and '__idiv__' or '__itruediv__',
    '//=': '__ifloordiv__',
    '%=': '__imod__',
    '**=': '__ipow__',
    '<<=': '__ilshift__',
    '>>=': '__irshift__',
    '&=': '__iand__',
    '^=': '__ixor__',
    '|=': '__ior_',
    }
def __iadd__(x, y):
    x += y
    return x

def __isub__(x, y):
    x -= y
    return x

def __imul__(x, y):
    x *= y
    return x

def __idiv__(x, y):
    x /= y
    return x
 
def __ifloordiv__(x, y):
    x //= y
    return x

def __imod__(x, y):
    x %= y
    return x

def __ipow__(x, y):
    x **= y
    return x

def __ilshift__(x, y):
    x <<= y
    return x

def __irshift__(x, y):
    x >>= y
    return x

def __iand__(x, y):
    x &= y
    return x

def __ixor__(x, y):
    x ^= y
    return x

def __ior__(x, y):
    x |= y
    return x


inplace_ops = {
    '+=': __iadd__,
    '-=': __isub__,
    '*=': __imul__,
    '/=': __idiv__,
    '//=': __ifloordiv__,
    '%=': __imod__,
    '**=': __ipow__,
    '<<=': __ilshift__,
    '>>=': __irshift__,
    '&=': __iand__,
    '^=': __ixor__,
    '|=': __ior__,
    }


def protected_inplacevar(op, var, expr):
    """Do an inplace operation

    If the var has an inplace slot, then disallow the operation
    unless the var is a list.
    """
    if (hasattr(var, inplace_slots[op])
        and not isinstance(var, valid_inplace_types)
        ):
        try:
            cls = var.__class__
        except AttributeError:
            cls = type(var)
        raise TypeError(
            "Augmented assignment to %s objects is not allowed"
            " in untrusted code" % cls.__name__
            )
    return inplace_ops[op](var, expr)





hc_builtins = safe_builtins.copy()
hc_builtins['iter'] = __builtins__['iter']
hc_builtins['locals'] = __builtins__['locals']
hc_globals = dict(__builtins__ = hc_builtins,
                  _write_ = full_write_guard,
                  _getattr_=getattr,
                  _getiter_=hc_builtins['iter'],
                  _print_ = __builtins__['print'],
                  _inplacevar_=protected_inplacevar)
